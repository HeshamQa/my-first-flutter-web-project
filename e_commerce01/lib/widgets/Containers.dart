import 'package:e_commerce01/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container container(w,h){
  return
    Container(
      width: w,
      height: h,
      margin: EdgeInsets.all( 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 25,
            offset: Offset(0, 0),
          ),
        ],
        color: colours.blu,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)
        ),
      ),
  );
}