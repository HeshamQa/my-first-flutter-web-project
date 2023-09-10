import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:http/http.dart' as http;

import '../Models/CartModel.dart';
import '../const_values.dart';
import '../general.dart';


class CartProv extends ChangeNotifier {
  List<CartModel> listCartModel = [];
  double totalPrice = 0;

  getCart() async {
    EasyLoading.show(status: 'loading...');
    listCartModel = [];
    totalPrice = 0;
    General.getPrefString(ConsValues.ID, "").then(
          (idUser) async {
        final response = await http.post(
          Uri.parse(
            "${ConsValues.BASEURL}/getCart.php",
          ),
          body: {
            "IdUsers": idUser,
          },
        );
        EasyLoading.dismiss();
        if (response.statusCode == 200) {
          var jsonBody = jsonDecode(response.body);
          var cart = jsonBody['cart'];
          if(cart!=null) {
            for (Map i in cart) {
              listCartModel.add(CartModel.fromJson(i));
              totalPrice =
                  totalPrice + int.parse(i['Price']) * int.parse(i['Count']);
            }
          }

          notifyListeners();
        }
      },
    );
  }

  addToCart({required var idItem}) async {
    EasyLoading.show(status: 'loading...');
    General.getPrefString(ConsValues.ID, "").then(
          (idUser) async {
        await http.post(
          Uri.parse("${ConsValues.BASEURL}/addToCart.php"),
          body: {
            "IdUsers": idUser,
            "IdItems": idItem,
          },
        );
        EasyLoading.dismiss();
      },
    );
  }

  updateItemCount(var id, var count,var index) async {

    EasyLoading.show(status: 'loading...');
    //General.getPrefString(ConsValues.ID, "").then(
    //(idUser) async {
    if (count <= 0) {
      deleteItemFromCart(id);
      listCartModel.removeAt(index);
    }
    else {
      final response = await http.post(
        Uri.parse("${ConsValues.BASEURL}/updateItemCount.php"),
        body: {
          "Id": id,
          "Count": count.toString(),
        },
      );
      if (response.statusCode == 200) {
        print(id);
        listCartModel[index].Count = count.toString();
        totalPrice = 0;
        for (CartModel cartModel in listCartModel) {
          totalPrice = totalPrice +
              int.parse(cartModel.Price) * int.parse(cartModel.Count);
        }
      }
    }
    // },);

    EasyLoading.dismiss();
    notifyListeners();
  }

  deleteItemFromCart(var id) async{
    print(id);
    EasyLoading.show(status: 'loading...');
    final response = await http.post(
      Uri.parse("${ConsValues.BASEURL}/deleteFromCart.php"),
      body: {
        "Id": id,
      },
    );
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      // Item deleted successfully
      print('Item removed from cart');
      totalPrice = 0;
      print(totalPrice);
      for (CartModel cartModel in listCartModel) {
        totalPrice = totalPrice +
            int.parse(cartModel.Price) * int.parse(cartModel.Count);
      }
      print(totalPrice);
    } else {
      // Error occurred while deleting the item
      throw Exception('Error removing item from cart');
    }
    notifyListeners();
  }

}

