import 'package:e_commerce01/Providers/CartProvider.dart';
import 'package:e_commerce01/Providers/items_prov.dart';
import 'package:e_commerce01/Screens/medium/mediumHomePage.dart';
import 'package:e_commerce01/bolean.dart';
import 'package:e_commerce01/colors.dart';
import 'package:e_commerce01/widgets/medium/meditemdetscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class mediumBody extends StatefulWidget {
  const mediumBody({Key? key}) : super(key: key);

  @override
  State<mediumBody> createState() => _mediumBodyState();
}

class _mediumBodyState extends State<mediumBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      color: colours.blu,
      child: Consumer<ItemProv>(
        builder: (context, value, child) {
          return GridView.builder(
            padding: EdgeInsets.all(15),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 50,
              mainAxisSpacing: 30,
              childAspectRatio: 3 / 5,
            ),
            itemCount: value.listItemModel.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                textDirection: TextDirection.ltr,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            colours.bk,
                            colours.blu,
                          ],
                          stops: [0.0, 1.0],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(
                          color: colours.yl,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 15,
                            offset: Offset(0.0, 0.0),
                          )
                        ]),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.network(
                          value.listItemModel[index].HomeImage,
                        ),
                        Spacer(),
                        Text(value.listItemModel[index].Name,
                            style: TextStyle(
                              color: colours.yl,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.fade),
                        Spacer(),
                        Text(
                          "${value.listItemModel[index].Price.toString()}\$",
                          style: TextStyle(
                            color: colours.yl,
                            fontWeight: FontWeight.bold,
                          ),
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                        ),
                        Spacer(),
                        ElevatedButton(
                          style: ButtonStyle(
                            shadowColor: MaterialStatePropertyAll(colours.gr),
                            backgroundColor:
                                MaterialStatePropertyAll(colours.bk),
                            fixedSize: MaterialStatePropertyAll(
                              Size(175, 25),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Add To Cart",
                            style: TextStyle(color: colours.yl),
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          style: ButtonStyle(
                            shadowColor: MaterialStatePropertyAll(colours.gr),
                            backgroundColor:
                                MaterialStatePropertyAll(colours.bk),
                            fixedSize: MaterialStatePropertyAll(
                              Size(175, 25),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => medItemDetScreen(
                                    itemModel: value.listItemModel[index],
                                  ),
                                ));
                          },
                          child: Text(
                            "Show Details",
                            style: TextStyle(color: colours.yl),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
