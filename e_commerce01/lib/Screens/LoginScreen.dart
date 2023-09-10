import 'dart:convert';
import 'package:e_commerce01/Screens/medium/mediumHomePage.dart';
import 'package:e_commerce01/Screens/small/smallHomePage.dart';
import 'package:e_commerce01/helpers/responsiveness.dart';
import 'package:http/http.dart'as http;
import 'package:e_commerce01/Screens/SignUpScreen.dart';
import 'package:e_commerce01/Screens/large/homepages.dart';
import 'package:e_commerce01/colors.dart';
import 'package:e_commerce01/const_values.dart';
import 'package:e_commerce01/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../widgets/AppBar.dart';
import '../widgets/Containers.dart';

class LoginScreen extends StatelessWidget {

  var w;
  var h;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar('LogIn'),
      backgroundColor: colours.gr,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            container(w, h),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image.asset("assets/images/logo.jpg"),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: emailTextEditingController,
                      style: TextStyle(
                        color: colours.yl,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.25),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colours.yl,
                            width: 2,
                            strokeAlign: 10,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colours.yl,
                            width: 2,
                            strokeAlign: 10,
                          ),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: colours.yl,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      style: TextStyle(color: colours.yl),
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.25),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colours.yl,
                            width: 2,
                            strokeAlign: 10,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colours.yl,
                            width: 2,
                            strokeAlign: 10,
                          ),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: colours.yl,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                      onPressed: () {
                        login(context);
                        ConsValues.isLoggedin=true;
                      },
                      child: Text(
                        "LogIn",
                        style: TextStyle(
                          color: colours.yl,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shadowColor: colours.gr,
                        backgroundColor: colours.bk,
                        fixedSize: Size(w - 72, 40),
                      )),
                  Center(
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Don't have an account?",
                              style: TextStyle(color: colours.wh),
                            )),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ));
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              color: colours.yl,
                            ),
                          ),
                        ),
                      ],
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

  login(BuildContext context) async {
    EasyLoading.show(status: 'loading...');

    final response = await http.post(
      Uri.parse("${ConsValues.BASEURL}/login.php"),
      body: {
        "Email": emailTextEditingController.text,
        "Password": passwordTextEditingController.text,
      },
    );
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      print("jsonBody = $jsonBody");

      if (jsonBody["result"]) {
        General.savePrefString(ConsValues.ID, jsonBody['Id'].toString());
        General.savePrefString(ConsValues.NAME, jsonBody['Name']);
        General.savePrefString(ConsValues.EMAIL, jsonBody['Email']);
        General.savePrefString(ConsValues.PHONE, jsonBody['Phone']);
        General.savePrefString(ConsValues.USER_TYPE, jsonBody['IdUserType'].toString());
        if (jsonBody['IdUserType'].toString() == "1") {
          Navigator.of(context as BuildContext).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const Responsiveness(largeScreen: HomePage(), mediumScreen: mediumHomePage(), smallScreen: smallHomePage())));
        } //else if (jsonBody['UserType'] == "2") {
        //Navigator.of(context as BuildContext).pushReplacement(MaterialPageRoute(
        //  builder: (BuildContext context) => const AdminMainScreen()));
        // }
        else {
          showDialog(
            context: context as BuildContext,
            builder: (context) {
              return AlertDialog(
                content: Text(jsonBody["UserType Error"]),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK"))
                ],
              );
            },
          );
        }
      } else {
        showDialog(
          context: context as BuildContext,
          builder: (context) {
            return AlertDialog(
              content: Text(jsonBody["msg"]),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            );
          },
        );
      }
    }
  }
}
