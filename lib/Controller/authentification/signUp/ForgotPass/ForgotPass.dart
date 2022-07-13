import 'package:flutter/material.dart';
import 'package:sportpal/Service/UserService.dart';
import 'package:sportpal/Controller/authentification/signUp/Sname.dart';
import 'package:sportpal/Controller/authentification/signUp/Sphone.dart';

import 'ConfirmPass.dart';



class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  late String? _email;
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;
    bool isTrue = false;


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),

            Padding(padding: const EdgeInsets.fromLTRB(30, 50, 0, 0)
              ,child: Text(
                "Type",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.blue[800],
                    fontSize: 35,
                    fontFamily: 'Cardo'
                ),
              ),),
            Padding(padding: const EdgeInsets.fromLTRB(30, 10, 0, 0)
              ,child: Text(
                "Your Email ",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.blue[800],
                    fontSize: 35,
                    fontFamily: 'Cardo'
                ),
              ),),
            SizedBox(height: 100,),
            Container(
              child: Form(
                key: _keyForm,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                  child: TextFormField(

                    onSaved: (String? value) {
                      _email = value;
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Can't be empty";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      hintText: "John",
                      hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[350],
                          fontWeight: FontWeight.w600),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 27, horizontal: 25),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 185,),
            Center(

                child: InkWell(
                  onTap: () async{

                    if(_keyForm.currentState!.validate()) {
                      _keyForm.currentState!.save();
                      Map<String, String> emailMap = {
                        "email": _email!
                      };
                      var reponse = await UserService().forgotPass(emailMap);
                      if (reponse == "no user") {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              title: Text("Information"),
                              content: Text("No user found !"),
                            );
                          },
                        );
                      }else if(reponse == "token"){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              title: Text("Information"),
                              content: Text("Mail already sent"),
                            );
                          },
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPass(vraiCode:reponse,mail: _email!,)));
                      }
                      else{

                        Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPass(vraiCode:reponse,mail: _email!,)));
                      }
                      setState(() {
                        isTrue = !isTrue;
                      });
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: scrWidth * 0.80,
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isTrue ? Color(0xff0962ff) : Colors.grey,
                      ),
                      color: isTrue ? Color(0xff0962ff) : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontFamily: 'ProductSans',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isTrue ?  Colors.white : Colors.grey ,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
