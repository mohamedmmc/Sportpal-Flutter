import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportpal/variables.dart';

import '../../authentification/signUp/Semail.dart';
import '../home/MenuWidget.dart';
import 'onBoardingPage.dart';

class ReadTermsAndConditions extends StatefulWidget {
  const ReadTermsAndConditions({Key? key}) : super(key: key);

  @override
  _ReadTermsAndConditionsState createState() => _ReadTermsAndConditionsState();
}

class _ReadTermsAndConditionsState extends State<ReadTermsAndConditions> {

  bool clicked9 = false;
  bool clicked8 = false;
  bool clicked7 = false;
  bool clicked6 = false;
  bool clicked5 = false;
  bool clicked4 = false;
  bool clicked3 = false;
  bool clicked2 = false;
  bool clicked1 = false;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: MenuWidget(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: size.height * 0.02
          ),
          height: size.height * 2,
          width: size.width,
          child: Column(
            children: [
              SizedBox(height: 40,),
              Row(
                children: [
                  SizedBox(width: 60,),
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
                  Icon(Icons.check_box, color: themeColor),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            clicked1 = !clicked1;
                          });
                        },
                        child: Text(
                          "These terms and conditions (“Agreement”) set forth the general terms and conditions of your use of the “SportPal” mobile application (“Mobile Application” or “Service”) and any of its related products and services (collectively, “Services”). This Agreement is legally binding between you (“User”, “you” or “your”) and this Mobile Application developer (“Operator”, “we”, “us” or “our”). If you are entering into this agreement on behalf of a business or other legal entity, you represent that you have the authority to bind such entity to this agreement, in which case the terms “User”, “you” or “your” shall refer to such entity. If you do not have such authority, or if you do not agree with the terms of this agreement, you must not accept this agreement and may not access and use the Mobile Application and Services. By accessing and using the Mobile Application and Services, you acknowledge that you have read, understood, and agree to be bound by the terms of this Agreement. You acknowledge that this Agreement is a contract between you and the Operator, even though it is electronic and is not physically signed by you, and it governs your use of the Mobile Application and Services. This terms and conditions policy was created with the help of the terms and conditions generator.",
                          overflow: TextOverflow.ellipsis,
                          maxLines: clicked1 ? 14 : 2,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'productsans',
                              color: Colors.black54),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(Icons.check_box, color: themeColor),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            clicked2 = !clicked2;
                          });
                        },
                        child: Text(
                          "If you create an account in the Mobile Application, you are responsible for maintaining the security of your account and you are fully responsible for all activities that occur under the account and any other actions taken in connection with it. We may monitor and review new accounts before you may sign in and start using the Services. Providing false contact information of any kind may result in the termination of your account. You must immediately notify us of any unauthorized uses of your account or any other breaches of security. We will not be liable for any acts or omissions by you, including any damages of any kind incurred as a result of such acts or omissions. We may suspend, disable, or delete your account (or any part thereof) if we determine that you have violated any provision of this Agreement or that your conduct or content would tend to damage our reputation and goodwill. If we delete your account for the foregoing reasons, you may not re-register for our Services. We may block your email address and Internet protocol address to prevent further registration.",
                          maxLines: clicked2 ? 10 : 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'productsans',
                              color: Colors.black54),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(Icons.check_box, color: themeColor),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            clicked3 = !clicked3;
                          });
                        },
                        child: Text(
                          "If you create an account in the Mobile Application,"" you are responsible for maintaining the security of your"" account and you are fully responsible for all activities"" that occur under the account and any other actions taken"" in connection with it. We may monitor and review new accounts"" before you may sign in and start using the Services."" Providing false contact information of any kind may result"" in the termination of your account. You must immediately notify ""us of any unauthorized uses of your account or any other breaches of security."" We will not be liable for any acts or omissions by you, including any damages"" of any kind incurred as a result of such acts or omissions. We may suspend,"" disable, or delete your account (or any part thereof) if we determine that ""you have violated any provision of this Agreement or that your conduct or content"" would tend to damage our reputation and goodwill. If we delete your account for"" the foregoing reasons, you may not re-register for our Services."" We may block your email address and Internet protocol address to"" prevent further registration.",
                          overflow: TextOverflow.ellipsis,
                          maxLines: clicked3 ? 10 : 2,
                          style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'productsans',
                          color: Colors.black54),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(Icons.check_box, color: themeColor),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            clicked4 = !clicked4;
                          });
                        },
                        child: Text(
                          "User content : We do not own any data, information or material (collectively, “Content”) that you submit in the Mobile Application in the course of using the Service. You shall have sole responsibility for the accuracy, quality, integrity, legality, reliability, appropriateness, and intellectual property ownership or right to use of all submitted Content. We may, but have no obligation to, monitor and review the Content in the Mobile Application submitted or created using our Services by you. You grant us permission to access, copy, distribute, store, transmit, reformat, display and perform the Content of your user account solely as required for the purpose of providing the Services to you. Without limiting any of those representations or warranties, we have the right, though not the obligation, to, in our own sole discretion, refuse or remove any Content that, in our reasonable opinion, violates any of our policies or is in any way harmful or objectionable. You also grant us the license to use, reproduce, adapt, modify, publish or distribute the Content created by you or stored in your user account for commercial, marketing or any similar purpose.",
                          overflow: TextOverflow.ellipsis,
                          maxLines: clicked4 ? 10 : 2,
                          style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'productsans',
                          color: Colors.black54),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.check_box,
                    color: themeColor,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            clicked5 = !clicked5;
                          });
                        },
                        child: Text(
                          "Backups : We are not responsible for the Content residing in the Mobile Application. In no event shall we be held liable for any loss of any Content. It is your sole responsibility to maintain appropriate backup of your Content. Notwithstanding the foregoing, on some occasions and in certain circumstances, with absolutely no obligation, we may be able to restore some or all of your data that has been deleted as of a certain date and time when we may have backed up data for our own purposes. We make no guarantee that the data you need will be available.",
                          overflow: TextOverflow.ellipsis,
                          maxLines: clicked5 ? 10 : 2,
                          style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'productsans',
                          color: Colors.black54),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.check_box,
                    color: themeColor,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            clicked6 = !clicked6;
                          });
                        },
                        child: Text(
                          "Changes and amendments We reserve the right to modify this Agreement or its terms related to the Mobile Application and Services at any time at our discretion. When we do, we will revise the updated date at the bottom of this page. We may also provide notice to you in other ways at our discretion, such as through the contact information you have provided.",
                          overflow: TextOverflow.ellipsis,
                          maxLines: clicked6 ? 10 : 2,
                          style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'productsans',
                          color: Colors.black54),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.check_box,
                    color: themeColor,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            clicked7 = !clicked7;
                          });
                        },
                        child: Text(
                          "An updated version of this Agreement will be effective immediately upon the posting of the revised Agreement unless otherwise specified. Your continued use of the Mobile Application and Services after the effective date of the revised Agreement (or such other act specified at that time) will constitute your consent to those changes.",
                          overflow: TextOverflow.ellipsis,
                          maxLines: clicked7 ? 10 : 2,
                          style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'productsans',
                          color: Colors.black54),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.check_box,
                    color: themeColor,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            clicked8 = !clicked8;
                          });
                        },
                        child: Text(
                          "Acceptance of these terms : You acknowledge that you have read this Agreement and agree to all its terms and conditions. By accessing and using the Mobile Application and Services you agree to be bound by this Agreement. If you do not agree to abide by the terms of this Agreement, you are not authorized to access or use the Mobile Application and Services.",
                          overflow: TextOverflow.ellipsis,
                          maxLines: clicked8 ? 10 : 2,
                          style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'productsans',
                          color: Colors.black54),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.check_box,
                    color: themeColor,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            clicked9 = !clicked9;
                          });
                        },
                        child: Text(
                          "Contacting us : If you have any questions, concerns, or complaints regarding this Agreement, we encourage you to contact us using this email  :sportpaldev@gmail.com This document was last updated on April 8, 2022",
                          overflow: TextOverflow.ellipsis,
                          maxLines: clicked9 ? 10 : 2,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'productsans',
                              color: Colors.black54),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
