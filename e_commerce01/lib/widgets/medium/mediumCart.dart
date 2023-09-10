import 'package:e_commerce01/Providers/CartProvider.dart';
import 'package:e_commerce01/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Screens/placeorder.dart';

class mediumCart extends StatefulWidget {
  const mediumCart({Key? key}) : super(key: key);

  @override
  State<mediumCart> createState() => _mediumCartState();
}

class _mediumCartState extends State<mediumCart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
          color: colours.blu,
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                child: Consumer<CartProv>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(15),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                colours.bk,
                                colours.blu,
                              ],
                              stops: [0.0, 1.0],
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
                          child: Row(
                            children: [
                              Image.asset(
                                value.listCartModel[index].HomeImage,
                                width: 200,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    value.listCartModel[index].Name,
                                    style: TextStyle(
                                      color: colours.yl,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          var newCount = value
                                              .listCartModel[index].Count += 1;
                                          value.updateItemCount(
                                              value.listCartModel[index].Id,
                                              newCount,
                                              index);
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: colours.yl,
                                        ),
                                      ),
                                      Text(
                                        value.listCartModel[index].Price
                                            .toString(),
                                        style: TextStyle(
                                          color: colours.yl,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          var newCount = value
                                              .listCartModel[index].Count -= 1;
                                          value.updateItemCount(
                                              value.listCartModel[index].Id,
                                              newCount,
                                              index);
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          color: colours.yl,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        );
                      },
                      itemCount: value.listCartModel.length,
                    );
                  },
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Total Price = ",
                    style: TextStyle(
                      color: colours.yl,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Consumer<CartProv>(
                    builder: (context, value, child) {
                      return Text(
                        value.totalPrice.toString(),
                        style: TextStyle(
                          color: colours.yl,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaceOrder(),
                          ));
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(color: colours.yl),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(colours.bk),
                      fixedSize: MaterialStatePropertyAll(
                        Size(100, 25),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }
}
