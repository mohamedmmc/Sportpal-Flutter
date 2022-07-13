import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportpal/Controller/authentification/signIn.dart';
import 'package:sportpal/Controller/screens/onBoarding/onBoardingPage.dart';

import 'authentification/signUp/Semail.dart';

class Intropage extends StatefulWidget {
  const Intropage({Key? key}) : super(key: key);

  @override
  Intropage_State createState() => Intropage_State();
}

class Intropage_State extends State<Intropage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/introduction.jpg"),
                  fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.6)
                ])),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const Text(
                    "Find your SportPAL",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "SportPAL is an application that helps you find partners to play the sport you like whenever you want and whereever you are",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      //todo route to go to register page
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
