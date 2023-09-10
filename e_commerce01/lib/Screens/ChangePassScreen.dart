import 'package:e_commerce01/colors.dart';
import 'package:e_commerce01/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../const_values.dart';
import '../general.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({Key? key}) : super(key: key);

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  var width;
  var height;
  TextEditingController passTextEditingController = TextEditingController();
  TextEditingController confirmTextEditingController = TextEditingController();

  String? id;

  bool showErrorConfirm = false;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    id = await General.getPrefString(ConsValues.ID, "");
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colours.blu,
      appBar: appBar("Update Password"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child:TextField(
              controller: passTextEditingController,
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
          labelText: 'Password',
          labelStyle: TextStyle(
            color: colours.yl,
          ),
        ),
            ),),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
              controller: confirmTextEditingController,
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
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                    color: colours.yl,
                  ),
                ),
            ),
      ),
            Padding(
              padding: EdgeInsets.all(10),
              child:ElevatedButton(
                onPressed: () {
                showErrorConfirm = passTextEditingController.text !=
                    confirmTextEditingController.text;
                if (!showErrorConfirm) {
                  updatePassword();
                }
                setState(() {});
              },
                style: ButtonStyle(
                  shadowColor: MaterialStatePropertyAll(colours.gr),
                  backgroundColor:
                  MaterialStatePropertyAll(colours.bk),
                  fixedSize: MaterialStatePropertyAll(
                    Size(350, 30),
                  ),
                ),
                child: Text("Update",style: TextStyle(color: colours.yl),),
              ),),
          ],
        ),
      ),
    );
  }

  updatePassword() async {
    EasyLoading.show(status: 'loading...');
    final response = await http.post(
      Uri.parse("${ConsValues.BASEURL}/updatePassword.php"),
      body: {
        "Id": id,
        "Password": passTextEditingController.text,
      },
    );
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      Navigator.pop(context);
    }
  }
}
