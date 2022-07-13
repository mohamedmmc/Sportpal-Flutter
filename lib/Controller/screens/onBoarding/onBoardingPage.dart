import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../authentification/signUp/Semail.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: IntroductionScreen(
      skipOrBackFlex: 0,
      nextFlex: 0,
      animationDuration: 750,
      showSkipButton: true,
      skip: Text("Skip"),
      next: Icon(Icons.arrow_forward),
      done: Text(
        "Done",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      dotsDecorator: getDotDecoration(),
      onDone: () {
        goToHome(context);
      },
      pages: [
        PageViewModel(
            title: "Be yourself",
            body: "Make sure your photos, age and bio are true to who you are",
            image: buildImage("assets/images/Itennis.jpg"),
            decoration: getPageDecoration()),
        PageViewModel(
            title: "Play it cool ",
            body: "Respect others and them as you would like to be treated",
            image: buildImage("assets/images/Iesport.jpg"),
            decoration: getPageDecoration()),
        PageViewModel(
            title: "Be proactive  ",
            body: "Make sure to report any bad behavior in order to keep our community safe and clean",
            image: buildImage("assets/images/Ifoot.jpg"),
            decoration: getPageDecoration()),
        PageViewModel(
          title: "Stay safe",
          body: "Don't be too quick to give out personal information."
              "\n"
              "\n Make sure to read our terms and conditions",
          image: buildImage("assets/images/Ibasket.jpg"),
          decoration: getPageDecoration(),
          footer: CheckboxListTile(
            title: Text("I accept and agree on term and conditions ",
                style:
                    TextStyle(fontFamily: 'Cardo', color: Colors.blue)),
            secondary: Icon(Icons.public),
            controlAffinity: ListTileControlAffinity.leading,
            value: _checked,
            activeColor: Colors.orange,
            checkColor: Colors.black,
            onChanged: (bool? value) {
              setState(() {
                _checked = value!;
              });
            },
          ),
        ),
      ],
    ));
  }

  Widget buildImage(String path) => Center(
        child: Image.asset(
          path,
          width: 400,
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Cardo'),
        bodyTextStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey,
            fontFamily: 'Cardo',
            wordSpacing: 6),
        titlePadding: EdgeInsets.all(1).copyWith(bottom: 30),
        imagePadding: EdgeInsets.all(10),
      );

  DotsDecorator getDotDecoration() => DotsDecorator(
      color: Color(0xFFBDBDBD),
      activeColor: Colors.orange,
      size: Size(10, 10),
      activeSize: Size(22, 10),
      activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)));

  void goToHome(context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => RegisterEmail()));
  }
}
