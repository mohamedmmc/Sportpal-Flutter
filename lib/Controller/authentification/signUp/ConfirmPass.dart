import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sportpal/Service/UserService.dart';
import 'package:sportpal/Controller/authentification/signUp/ConfirmPass.dart';
import 'package:sportpal/Controller/authentification/signUp/ResetPass.dart';
import 'package:sportpal/Controller/authentification/signUp/Sname.dart';
import 'package:sportpal/Controller/authentification/signUp/Sphone.dart';
import '../authentificationWidgets/Widgets/customInputBox.dart';



class ConfirmPass extends StatefulWidget {
  const ConfirmPass({Key? key, required this.vraiCode, required this.mail}) : super(key: key);
  final String vraiCode;
  final String mail;

  @override
  _ConfirmPasState createState() => _ConfirmPasState();
}

class _ConfirmPasState extends State<ConfirmPass> {
  late String? code;

  TextEditingController textEditingController = TextEditingController();

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
                "Code Sent To Email ",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 35,
                    fontFamily: 'Cardo'
                ),
              ),),

            SizedBox(height: 100,),
            Container(
              child: Form(
                key: _keyForm,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: PinCodeTextField(

                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.blue.shade50,
                    enableActiveFill: true,
                    controller: textEditingController,
                    onCompleted: (v) {
                      if(widget.vraiCode == code){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPass(mail: widget.mail,token: widget.vraiCode)));

                      }else{
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              title: Text("Information"),
                              content: Text("Incorrect code !"),
                            );
                          },
                        );
                      }
                    },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {

                        code = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  ),
                )
              ),
            ),
            SizedBox(height: 185,),
            Center(

              child: InkWell(
                onTap: () async{

                  if(_keyForm.currentState!.validate()) {
                    _keyForm.currentState!.save();
                    Map<String, String> emailMap = {
                      "email": code!
                    };
                    

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
