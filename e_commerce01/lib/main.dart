import 'package:e_commerce01/Screens/LoginScreen.dart';
import 'package:e_commerce01/Screens/large/homepages.dart';
import 'package:e_commerce01/Screens/medium/mediumHomePage.dart';
import 'package:e_commerce01/Screens/sittingsScreen.dart';
import 'package:e_commerce01/helpers/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce01/Screens/SignUpScreen.dart';
import 'package:provider/provider.dart';

import 'Providers/CartProvider.dart';
import 'Providers/item_image_prov.dart';
import 'Providers/items_prov.dart';
import 'Screens/ChangePassScreen.dart';
import 'Screens/small/smallHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [

    ChangeNotifierProvider<ItemProv>(
    create: (_) => ItemProv(),
    ),
    ChangeNotifierProvider<ItemImageProv>(
    create: (_) => ItemImageProv(),
    ),
    ChangeNotifierProvider<CartProv>(
    create: (_) => CartProv(),
    ),
    /*ChangeNotifierProvider<OrderHistoryProv>(
    create: (_) => OrderHistoryProv(),
    ),
    ChangeNotifierProvider<OrderHistoryDetailsProv>(
    create: (_) => OrderHistoryDetailsProv(),
    ),*/
    ],

    child: MaterialApp(

        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        ),
        home: Responsiveness(
        largeScreen: HomePage(),
          mediumScreen: mediumHomePage(),
        smallScreen: smallHomePage(),
        ),

        builder: EasyLoading.init(),
        ),
    );
  }
}
