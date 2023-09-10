
import 'dart:convert';
import 'package:e_commerce01/Screens/LoginScreen.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce01/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/AppBar.dart';
import '../widgets/Containers.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var w;
  // ignore: prefer_typing_uninitialized_variables
  var h;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

  SignupScreen({super.key});

  SignUp(BuildContext context) async {
    // API endpoint URL
    var apiUrl = 'http://localhost:81/apis/SignUp.php'; // Replace with your API endpoint URL

    // Prepare the request body
    var body = {
      "Name": nameTextEditingController.text,
      "Email": emailTextEditingController.text,
      "Phone": phoneTextEditingController.text,
      "Password": passwordTextEditingController.text,
    };

    // Send the POST request
    var response = await http.post(Uri.parse(apiUrl), body: body);

    // Handle the response
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var message = data['message']; // Retrieve the response message

      if (message == 'User registered successfully') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Sign Up Error'),
            content: Text(message),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    } else if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      var message = data['message']; // Retrieve the error message

      showDialog(
        barrierColor: colours.blu,

        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: colours.blu,
          titleTextStyle: TextStyle(color: colours.yl),

          title: Text('Sign Up Error',style: TextStyle(color: colours.yl),),
          content: Text(message,style: TextStyle(color: colours.yl)),
          actions: [
            TextButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(colours.bk)),
              child: Text('OK',style: TextStyle(color: colours.yl),),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } else {
      throw Exception(Text('Failed to sign up: ${response.statusCode}',style: TextStyle(color: colours.yl),));
    }
  }


  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar("SignUp"),
      backgroundColor: colours.gr,
      body: SafeArea(
        child: Stack(
          children: [
            container(w, h),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        "assets/images/logo.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        style: TextStyle(color: colours.yl),
                        controller: nameTextEditingController,
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
                          labelText: 'UserName',
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
                        controller: emailTextEditingController,
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
                        controller: phoneTextEditingController,
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
                          labelText: 'Phone Number',
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
                        obscureText: true,
                        controller: passwordTextEditingController,
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
                        onPressed: () async {
                          await SignUp(context);
                        },
                        child: Text("SignUp",style: TextStyle(color: colours.yl),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colours.bk,
                          fixedSize: Size(480, 40),
                          shadowColor: colours.gr,
                        )),
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
