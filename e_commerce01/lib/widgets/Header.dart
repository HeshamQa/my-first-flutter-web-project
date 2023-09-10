import 'package:e_commerce01/colors.dart';
import 'package:flutter/material.dart';

AppBar HomeAppBar(text) {
  return AppBar(
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
    iconTheme: IconThemeData(color: colours.yl),
    actions: [
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 25, 8),
        child: SearchBar(
          leading: Icon(
            Icons.search,
            color: colours.yl,
          ),
          constraints: BoxConstraints(
            maxWidth: 200,
          ),
          backgroundColor:
              MaterialStatePropertyAll(colours.bk.withOpacity(0.3)),
          elevation: MaterialStateProperty.all(0),
          hintText: "Search...",
          hintStyle: MaterialStateProperty.all(
            TextStyle(
              color: colours.yl,
              fontWeight: FontWeight.bold,
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: colours.yl, width: 1, style: BorderStyle.solid),
          ),
          textStyle: MaterialStateProperty.all(
              TextStyle(color: colours.yl, fontWeight: FontWeight.bold)),
        ),
      ),
    ],
  );
}
