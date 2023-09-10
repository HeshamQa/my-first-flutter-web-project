import 'package:e_commerce01/Screens/large/homepages.dart';
import 'package:e_commerce01/bolean.dart';
import 'package:e_commerce01/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/item_model.dart';
import '../../Providers/CartProvider.dart';
import '../../Providers/item_image_prov.dart';

class itemDetScreen extends StatefulWidget {
  ItemModel itemModel;

  itemDetScreen({Key? key, required this.itemModel}) : super(key: key);

  @override
  State<itemDetScreen> createState() => _itemDetScreenState();
}

class _itemDetScreenState extends State<itemDetScreen> {
  var w;
  var h;

  @override
  void initState() {
    super.initState();
    Provider.of<ItemImageProv>(context, listen: false)
        .getItemsImages(idItems: widget.itemModel.Id);
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colours.gr,
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
              icon: Icon(
                Icons.arrow_back,
                color: colours.yl,
              ),
            ),
            Stack(
              children: [
                Container(
                  width: w,
                  height: 500,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 350,
                          height: 300,
                          child: Consumer<ItemImageProv>(
                            builder: (context, value, child) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: value.listItemImageModel.length,
                                itemBuilder: (context, index) {
                                  return Image.network(
                                    value.listItemImageModel[index].ImageUrl,
                                    width: 350,
                                    height: 300,
                                    fit: BoxFit.fill,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Text(
                          widget.itemModel.Name,
                          style: TextStyle(
                            color: colours.yl,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "PRICE : ${widget.itemModel.Price}\$",
                          style: TextStyle(
                            color: colours.yl,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "DESCRIPTION : ${widget.itemModel.Description}",
                          style: TextStyle(
                            color: colours.yl,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shadowColor: MaterialStatePropertyAll(colours.gr),
                            backgroundColor:
                                MaterialStatePropertyAll(colours.bk),
                            fixedSize: MaterialStatePropertyAll(
                              Size(350, 30),
                            ),
                          ),
                          onPressed: () async {
                            await Provider.of<CartProv>(context, listen: false)
                                .addToCart(idItem: widget.itemModel.Id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                            setState(() {
                              costbol.Home = false;
                              costbol.Cart = true;
                              costbol.Contact = false;
                            });
                          },
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
          ],
        ),
      ),
    );
  }
}
