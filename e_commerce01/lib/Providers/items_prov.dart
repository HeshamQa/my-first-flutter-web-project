import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../Models/item_model.dart';
import '../const_values.dart';


class ItemProv extends ChangeNotifier {
  List<ItemModel> listItemModel = [];

  getItems() async {
    EasyLoading.show(status: 'loading...');
    listItemModel = [];
    final response = await http.post(
      Uri.parse("${ConsValues.BASEURL}/getItems.php"),
    );
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var items = jsonBody['items'];
      for (Map i in items) {
        listItemModel.add(ItemModel.fromJson(i));
      }
      notifyListeners();
    }
  }


}
