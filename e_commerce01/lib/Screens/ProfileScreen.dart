import 'package:e_commerce01/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../const_values.dart';
import '../general.dart';
import '../widgets/AppBar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var width;
  var height;
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

  String? id;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    emailTextEditingController.text =
    await General.getPrefString(ConsValues.EMAIL, "");
    nameTextEditingController.text =
    await General.getPrefString(ConsValues.NAME, "");
    phoneTextEditingController.text =
    await General.getPrefString(ConsValues.PHONE, "");
    id = await General.getPrefString(ConsValues.ID, "");
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colours.blu,
      appBar: appBar("Settings"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 30,
            ),
           Padding (padding:EdgeInsets.all(10),
             child: TextField(
              style: TextStyle(
                color: colours.yl,
              ),
              decoration: InputDecoration(
                label: Text("Email",style: TextStyle(color: colours.yl),),
                filled: true,
                fillColor: Colors.black.withOpacity(0.25),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colours.yl,
                    width: 2,
                    strokeAlign: 10,
                  ),
                ),
              ),
              enabled: false,
              controller: emailTextEditingController,

            ),),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child:TextField(
              controller: nameTextEditingController,
              style: TextStyle(
                color: colours.yl,
              ),
              decoration: InputDecoration(
                label: Text("Name",style: TextStyle(color: colours.yl),),
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
            ),
            ),),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child:TextField(
              controller: phoneTextEditingController,
              style: TextStyle(
                color: colours.yl,
              ),
              decoration: InputDecoration(
                label: Text("phone",style: TextStyle(color: colours.yl),),
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
              ),
            ),),
            Padding(
              padding: EdgeInsets.all(10),
              child:ElevatedButton(
                style: ButtonStyle(
                  shadowColor: MaterialStatePropertyAll(colours.gr),
                  backgroundColor:
                  MaterialStatePropertyAll(colours.bk),
                  fixedSize: MaterialStatePropertyAll(
                    Size(350, 30),
                  ),
                ),
              onPressed: () {
                updateProfile();
              },
              child: Text("Update",style: TextStyle(color: colours.yl),),
            ),),
          ],
        ),
      ),
    );
  }

  updateProfile() async {
    EasyLoading.show(status: 'loading...');
    final response = await http.post(
      Uri.parse("${ConsValues.BASEURL}/updateProfile.php"),
      body: {
        "Id": id,
        "Name": nameTextEditingController.text,
        "Phone": phoneTextEditingController.text,
      },
    );
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      await General.savePrefString(
          ConsValues.NAME, nameTextEditingController.text);
      await General.savePrefString(
          ConsValues.PHONE, phoneTextEditingController.text);
      Navigator.pop(context);
    }
  }
}
