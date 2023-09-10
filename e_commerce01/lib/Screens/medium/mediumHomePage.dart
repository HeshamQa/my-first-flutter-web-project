import 'package:e_commerce01/Screens/LoginScreen.dart';
import 'package:e_commerce01/Screens/sittingsScreen.dart';
import 'package:e_commerce01/bolean.dart';
import 'package:e_commerce01/colors.dart';
import 'package:e_commerce01/widgets/medium/mediumCart.dart';
import 'package:e_commerce01/widgets/Header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/CartProvider.dart';
import '../../Providers/items_prov.dart';
import '../../const_values.dart';
import '../../helpers/responsiveness.dart';
import '../../widgets/large/Cart.dart';
import '../../widgets/large/ContactScreen.dart';
import '../../widgets/large/body.dart';
import '../../widgets/medium/mediumBody.dart';
import '../../widgets/small/smallBody.dart';
import '../../widgets/small/smallcart.dart';

class mediumHomePage extends StatefulWidget {
  const mediumHomePage({Key? key}) : super(key: key);

  @override
  State<mediumHomePage> createState() => _mediumHomePageState();
}

class _mediumHomePageState extends State<mediumHomePage> {
  var w;
  var h;

  @override
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
      appBar: HomeAppBar("Home"),
      drawer: Drawer(
        backgroundColor: colours.bk.withOpacity(0.1),
        elevation: 0,
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colours.blu,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  title: ConsValues.isLoggedin ? "Profile" : "LogIn",
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
                  });
                },
              ),
              DrawerList(
                title: '${costbol.totalPriceCart}\$',
                icons: Icons.shopping_cart_outlined,
                press: () {
                  setState(() {
                    costbol.Home=false;
                    costbol.Cart=true;
                    costbol.Contact=false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: colours.gr,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87.withOpacity(0.1),
          ),
          child: costbol.Home
              ? mediumBody()
              : costbol.Contact
                  ? ContactScreen()
              : costbol.Cart
              ? mediumCart()
                : mediumBody(),
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
