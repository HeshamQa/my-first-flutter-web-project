import 'package:e_commerce01/Screens/LoginScreen.dart';
import 'package:e_commerce01/Screens/sittingsScreen.dart';
import 'package:e_commerce01/bolean.dart';
import 'package:e_commerce01/colors.dart';
import 'package:e_commerce01/const_values.dart';
import 'package:e_commerce01/widgets/large/Cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/CartProvider.dart';
import '../../Providers/items_prov.dart';
import '../../widgets/large/ContactScreen.dart';
import '../../widgets/large/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var w;
  var h;
  void initState() {
    super.initState();
    Provider.of<ItemProv>(context, listen: false).getItems();
    Provider.of<CartProv>(context, listen: false).getCart();
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colours.gr,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //side menu
            Expanded(
              child: Drawer(
                backgroundColor: colours.gr,
                elevation: 0,
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colours.blu,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text(
                          "Paint Store",
                          style: TextStyle(
                            color: colours.yl,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DrawerList(
                          title: ConsValues.isLoggedin ? "Settings" : "LogIn",
                          icons: ConsValues.isLoggedin
                              ? Icons.settings_outlined
                              : Icons.person_outline_sharp,
                          press: () async {
                            if (!ConsValues.isLoggedin) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SettingsScreen(),
                                  ));
                            }
                          }),
                      DrawerList(
                        title: "Home",
                        icons: Icons.home_outlined,
                        press: () {
                          setState(() {
                            costbol.Contact = false;
                            costbol.Home = true;
                            costbol.Cart = false;
                            costbol.details = false;
                          });
                        },
                      ),
                      DrawerList(
                        title: "Contact",
                        icons: Icons.contact_support_outlined,
                        press: () {
                          setState(() {
                            costbol.Contact = true;
                            costbol.Home = false;
                            costbol.Cart = false;
                            costbol.details = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //main part
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: colours.gr,
                ),
                child: Column(
                  children: [
                    Container(
                      height: h * 0.1,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: colours.blu,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SearchBar(
                            leading: Icon(
                              Icons.search,
                              color: colours.yl,
                            ),
                            constraints: BoxConstraints(
                              maxWidth: w * 0.3,
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                                Colors.white.withOpacity(0.1)),
                            elevation: MaterialStateProperty.all(0),
                            hintText: "Search...",
                            hintStyle: MaterialStateProperty.all(
                              TextStyle(
                                color: colours.yl,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            side: MaterialStateProperty.all(
                              BorderSide(
                                  color: colours.yl,
                                  width: 1,
                                  style: BorderStyle.solid),
                            ),
                            textStyle: MaterialStateProperty.all(TextStyle(
                                color: colours.yl,
                                fontWeight: FontWeight.bold)),
                          ),
                          Spacer(),
                          Consumer<CartProv>(builder: (context, value, child) {
                            return Container(
                              width: 140,
                              child: DrawerList(
                                title: '${value.totalPrice.toString()}\$',
                                icons: Icons.shopping_cart_outlined,
                                press: () {
                                  setState(() {
                                    costbol.Home = false;
                                    costbol.Cart = true;
                                    costbol.Contact = false;
                                  });
                                },
                              ),
                            );
                          },),
                        ],
                      ),
                    ),
                    costbol.Home
                        ? const Body()
                        : costbol.Contact
                            ? ContactScreen()
                            : costbol.Cart
                                ? Cartt()
                                : Body(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  final String title;
  final VoidCallback press;
  final IconData icons;

  const DrawerList(
      {super.key,
      required this.title,
      required this.icons,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icons as IconData?, color: colours.yl),
      title: Text(
        title,
        style: TextStyle(
          color: colours.yl,
        ),
      ),
      onTap: press,
    );
  }
}