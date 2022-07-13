import 'package:flutter/material.dart';
import 'package:sportpal/constants.dart';
import 'package:sportpal/variables.dart';

import '../home/MenuWidget.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: themeColor,
        title: Text(
          "Contact us",
          style: TextStyle(
            fontSize: appBarTitleSize,
          ),
        ),
        leading: MenuWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Object",
                        border: InputBorder.none,
                        filled: true),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Message",
                        border: InputBorder.none,
                        filled: true),
                    maxLines: 7,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  MaterialButton(
                    height: 60,
                    minWidth: double.infinity,
                    onPressed: () {},
                    color: themeColor,
                    child: Text("Submit",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18
                    ),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
