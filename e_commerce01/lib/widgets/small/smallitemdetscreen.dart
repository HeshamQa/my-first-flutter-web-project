import 'package:e_commerce01/colors.dart';
import 'package:flutter/material.dart';

import '../../Models/item_model.dart';

class smallItemDetScreen extends StatefulWidget {
  ItemModel itemModel;
  smallItemDetScreen({Key? key,required this.itemModel}) : super(key: key);

  @override
  State<smallItemDetScreen> createState() => _smallItemDetScreenState();
}

class _smallItemDetScreenState extends State<smallItemDetScreen> {
  var w;
  var h;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        color: colours.blu,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: colours.yl,),
          ),
          SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: w,
                height: 400,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colours.bk,
                      colours.blu,
                      colours.bk,
                    ],
                    stops: [0.0, 0.5, 1.0],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  border: Border.all(
                    color: colours.yl,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colours.bk.withOpacity(0.8),
                      blurRadius: 15,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/logo.jpg",
                        width: 250,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        "NAME : Monaliza",
                        style: TextStyle(
                          color: colours.yl,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "PRICE : 1500\$",
                        style: TextStyle(
                          color: colours.yl,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "DESCRIPTION : here is the description\$",
                        style: TextStyle(
                          color: colours.yl,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shadowColor: MaterialStatePropertyAll(colours.gr),
                          backgroundColor: MaterialStatePropertyAll(colours.bk),
                          fixedSize: MaterialStatePropertyAll(
                            Size(250, 30),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Add To Cart",
                          style: TextStyle(color: colours.yl),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ),
        ],
      ),
    ),
    );
  }
}
