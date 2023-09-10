import 'dart:html';

import 'package:e_commerce01/Screens/large/homepages.dart';
import 'package:e_commerce01/Screens/medium/mediumHomePage.dart';
import 'package:e_commerce01/Screens/small/smallHomePage.dart';
import 'package:e_commerce01/colors.dart';
import 'package:e_commerce01/helpers/responsiveness.dart';
import 'package:flutter/material.dart';

import '../const_values.dart';
import '../general.dart';
import '../widgets/AppBar.dart';
import 'ChangePassScreen.dart';
import 'ProfileScreen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var width;
  var height;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colours.blu,
      appBar: appBar("Settings"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(15),child: ElevatedButton(
              style: ButtonStyle(
                shadowColor: MaterialStatePropertyAll(colours.gr),
                backgroundColor: MaterialStatePropertyAll(colours.bk),
                fixedSize: MaterialStatePropertyAll(
                  Size(350, 30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ProfileScreen();
                    },
                  ),
                );
              },
              child: Text("Profile",style: TextStyle(color: colours.yl),),
            ),
            ),
            Padding(padding: EdgeInsets.all(15),child: ElevatedButton(
              style: ButtonStyle(
                shadowColor: MaterialStatePropertyAll(colours.gr),
                backgroundColor: MaterialStatePropertyAll(colours.bk),
                fixedSize: MaterialStatePropertyAll(
                  Size(350, 30),
                ),
              ),
              child: Text("Update Password",style: TextStyle(color: colours.yl),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ChangePassScreen();
                    },
                  ),
                );
              },
            ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                style: ButtonStyle(
                  shadowColor: MaterialStatePropertyAll(colours.gr),
                  backgroundColor: MaterialStatePropertyAll(colours.bk),
                  fixedSize: MaterialStatePropertyAll(
                    Size(350, 30),
                  ),
                ),
                child: Text("Logout",style: TextStyle(color: colours.yl),),
                onPressed: () async {
                  await General.remove(ConsValues.NAME);
                  await General.remove(ConsValues.EMAIL);
                  await General.remove(ConsValues.PHONE);
                  await General.remove(ConsValues.ID);
                  await General.remove(ConsValues.USER_TYPE);
                  ConsValues.isLoggedin=false;

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Responsiveness(
                            largeScreen: HomePage(),
                            mediumScreen: mediumHomePage(),
                            smallScreen: smallHomePage());
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
