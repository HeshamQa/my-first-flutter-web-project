import 'package:e_commerce01/Screens/small/smallHomePage.dart';
import 'package:e_commerce01/colors.dart';
import 'package:e_commerce01/widgets/AppBar.dart';
import 'package:e_commerce01/widgets/Containers.dart';
import 'package:flutter/material.dart';

import '../helpers/responsiveness.dart';
import 'large/homepages.dart';
import 'medium/mediumHomePage.dart';

class PlaceOrder extends StatefulWidget {
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _streetNameController = TextEditingController();
  TextEditingController _buildingNoController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _cityController.dispose();
    _streetNameController.dispose();
    _buildingNoController.dispose();
    super.dispose();
  }
  var w;
  var h;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar('Form Screen'),
      backgroundColor: colours.gr,
      body: SafeArea(
        child: Stack(
          children: [
            container(w, h),
            Padding(
              padding: EdgeInsets.all(16),
              child:SingleChildScrollView(
                padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                    child:
                  TextField(
                    controller: _fullNameController,
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
                      labelText: 'Full Name',
                      labelStyle: TextStyle(
                        color: colours.yl,
                      ),
                    ),
                  ),
            ),
              Padding(padding: EdgeInsets.all(10),
              child:    
              TextField(
                    controller: _phoneNumberController,
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
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                        color: colours.yl,
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  ),
                  Padding(padding:EdgeInsets.all(10),
                  child:
                  TextField(
                    controller: _cityController,
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
                      labelText: 'City',
                      labelStyle: TextStyle(
                        color: colours.yl,
                      ),
                    ),
                  ),
                  ),
                  Padding(padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _streetNameController,
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
                      labelText: 'Street Name',
                      labelStyle: TextStyle(
                        color: colours.yl,
                      ),
                    ),
                  ),
                  ),
                  Padding(padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _buildingNoController,
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
                      labelText: 'Building No.',
                      labelStyle: TextStyle(
                        color: colours.yl,
                      ),
                    ),
                  ),
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Responsiveness(largeScreen: HomePage(), mediumScreen: mediumHomePage(), smallScreen: smallHomePage()),
                          ),
                        );
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: colours.yl,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shadowColor: colours.gr,
                        backgroundColor: colours.bk,
                        fixedSize: Size(w - 72, 40),
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
