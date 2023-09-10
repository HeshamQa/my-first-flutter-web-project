import 'package:e_commerce01/colors.dart';
import 'package:flutter/material.dart';

AppBar appBar(text){
  return AppBar(
    iconTheme: IconThemeData(color: colours.yl),
    elevation: 0,
    centerTitle: true,
    title: Text(text),
    backgroundColor: colours.blu,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: colours.yl,
      fontStyle: FontStyle.normal,
    ),
    );
}