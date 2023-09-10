import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../Models/item_image_model.dart';
import 'package:http/http.dart' as http;

import '../const_values.dart';

class ItemImageProv extends ChangeNotifier {
  List<ItemImageModel> listItemImageModel = [];

  getItemsImages({required var idItems}) async {
    listItemImageModel = [];
    EasyLoading.show(status: 'loading...');
    final response = await http.post(
      Uri.parse(
        "${ConsValues.BASEURL}/getItemsImages.php",
      ),
      body: {
        "IdItems": idItems,
      },
    );
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var itemimages = jsonBody['itemimages'];
      for (Map i in itemimages) {
        listItemImageModel.add(ItemImageModel.fromJson(i));
      }
      notifyListeners();
    }
  }
}
