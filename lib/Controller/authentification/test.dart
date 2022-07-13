import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'authentificationWidgets/Widgets/customInputBox.dart';



class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {

  final Color facebookColor = const Color(0xff39579A);
  final Color twitterColor = const Color(0xff00ABEA);
  final Color instaColor = const Color(0xffBE2289);
  final Color whatsappColor = const Color(0xff075E54);
  final Color linkedinColor = const Color(0xff0085E0);
  final Color githubColor = const Color(0xff202020);
  final Color googleColor = const Color(0xffDF4A32);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Social Buttons Example'),
    ),
    body: ListView(
      children: [
        SizedBox(height: 30,),
        LinearProgressIndicator(
          backgroundColor: Colors.grey,
        ),
        SizedBox(height: 30,),
        socialButtonCircle(
            facebookColor, FontAwesomeIcons.facebookF,
            iconColor: Colors.white, onTap: () {
          Fluttertoast.showToast(msg: 'I am circle facebook');
        }),
        socialButtonCircle(
            googleColor, FontAwesomeIcons.googlePlusG,
            iconColor: Colors.white, onTap: () {
          Fluttertoast.showToast(msg: 'I am circle google');
        }),
        socialButtonCircle(
            whatsappColor, FontAwesomeIcons.whatsapp,
            iconColor: Colors.white, onTap: () {
          Fluttertoast.showToast(msg: 'I am circle whatsapp');
        }),
        SizedBox(height: 40,),
        MyCustomInputBox(
          label: 'Name',
          inputHint: 'John',
        ),
      ],
    )
    );
  }
  static Widget socialButtonCircle(color, icon, {iconColor, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: iconColor,
          )), //
    );
  }



}
