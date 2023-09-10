import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        color: Color(0xff0F1A3D),
        child: ContactUs(
          dividerThickness: 1,
          dividerColor: Color(0xff081964),
          companyName: "Paint Store",
          textColor: Colors.white60,
          cardColor: Color(0xff091a65),
          companyColor: Color(0xff081f77),
          taglineColor: Colors.black,
          email: 'qaoudqa@gmail.com',
          instagram: "Hesham___qa",
          facebookHandle: "https://www.facebook.com/groups/140120453461576/?hoisted_section_header_type=recently_seen&multi_permalinks=1756697991803806",
          phoneNumberText: '+962 | 0788828337',
          phoneNumber: '+962788828337',
          emailText: "qaoudqa",
        ),
      ),
    );
  }
}
