import 'package:e_commerce01/colors.dart';
import 'package:e_commerce01/widgets/large/itemdetscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/items_prov.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var w;
  var h;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Expanded(
      flex: 7,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colours.blu,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Consumer<ItemProv>(
          builder: (context, value, child) {
            return GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 50,
                mainAxisSpacing: 30,
              ),
              itemCount: value.listItemModel.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  textDirection: TextDirection.ltr,
                  children: [
                    Container(
                      height: 750,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: colours.yl,
                            width: 2,
                          ),
                          gradient: LinearGradient(
                            colors: [
                              colours.bk,
                              colours.blu,
                            ],
                            stops: [0.0, 1.0],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 15,
                              offset: Offset(5, 5),
                            )
                          ]),
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 10),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shadowColor:
                                    MaterialStatePropertyAll(colours.gr),
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
                                      builder: (context) => itemDetScreen(
                                        itemModel: value.listItemModel[index],
                                      ),
                                    ),
                                );
                              },
                              child: Text(
                                "Show Details",
                                style: TextStyle(color: colours.yl),
                              ),
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
      ),
    );
  }
}
