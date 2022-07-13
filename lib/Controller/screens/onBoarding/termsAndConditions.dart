import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportpal/variables.dart';


import '../../authentification/signUp/Semail.dart';
import '../home/MenuWidget.dart';
import 'onBoardingPage.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(leading: MenuWidget(),),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: size.height * 0.02),
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.article_outlined,
                    size: size.height * 0.07,
                    color: themeColor,
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Terms of service",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.85))),
                      Text("Last updated Mar 23,2022",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(
                              fontSize: size.height * 0.01,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.7))),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                children: [
                  Icon(Icons.check_box,color:themeColor),
                  Text("aaaaaa"
                      ,style: TextStyle(fontSize: 16,fontFamily: 'productsans',color: Colors.black54),)
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Icon(Icons.check_box,color:themeColor),
                  Text("aaaaaa"
                    ,style: TextStyle(fontSize: 16,fontFamily: 'productsans',color: Colors.black54),)
                ],
              ),
              SizedBox(height: 30,),

              Row(
                children: [
                  Icon(Icons.check_box,color:themeColor),
                  Text("aaaaaa"
                    ,style: TextStyle(fontSize: 16,fontFamily: 'productsans',color: Colors.black54),)
                ],
              ),
              SizedBox(height: 30,),

              Row(
                children: [
                  Icon(Icons.check_box,color:themeColor),
                  Text("aaaaaa"
                    ,style: TextStyle(fontSize: 16,fontFamily: 'productsans',color: Colors.black54),)
                ],
              ),
              SizedBox(height: 30,),

              Row(
                children: [
                  Icon(Icons.check_box,color:themeColor,),
                  Text("aaaaaa"
                    ,style: TextStyle(fontSize: 16,fontFamily: 'productsans',color: Colors.black54),)
                ],
              ),
              SizedBox(height: 30,),

              Expanded(child: Container()),
              SizedBox(
                height: size.height * 0.015,
              ),
              Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.035),
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
                            AlertDialog(
                              title: Text("Warning"),
                              content: Text("You cannot proceed without accepting our terms and conditions"),
                              actions: [
                                FlatButton(onPressed: (){}, child: Text("Done"))
                              ],
                              shape: CircleBorder(),
                            );
                          },
                          child: TermsButton(
                              title: "Decline",
                              onTap: () {}
                              ),
                        )),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => RegisterEmail()));
                          },
                          child: TermsButton(
                              isAccepted: true, title: "Accept", onTap: () {
                          }),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TermsButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isAccepted;

  const TermsButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.isAccepted = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: isAccepted ? themeColor : Colors.white,
          border: Border.all(
            color: isAccepted ?  Colors.white:themeColor
          ),
          borderRadius: BorderRadius.circular(size.height * 0.01)),
      child: Text(
        "$title",
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
            fontSize: size.height * 0.02,
            fontWeight: FontWeight.w600,
            color: isAccepted ? Colors.white : themeColor),
      ),
    );
  }
}
