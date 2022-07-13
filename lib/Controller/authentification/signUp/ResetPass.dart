import 'package:flutter/material.dart';
import 'package:sportpal/Service/UserService.dart';
import 'package:sportpal/Controller/authentification/signIn.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({ Key? key, required this.token, required this.mail }) : super(key: key);
  final String token;
  final String mail;


  @override
  _ResetPassState createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {


  bool isTrue = false;

  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _isPasswordIdentic = false;
  String passv="";

  late String? newPass;
  late String? newPassR;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if(password.length >= 8)
        _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if(numericRegex.hasMatch(password))
        _hasPasswordOneNumber = true;

    });
  }

  passwordVerif(String p1,String p2){
    setState(() {
      _isPasswordIdentic = false;
      if(p1==p2)
        _isPasswordIdentic = true;
    });
  }
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),
            LinearProgressIndicator(
              backgroundColor: Colors.white,
              value: 1,
              color: Color(0xff0962ff),
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: _keyForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: const EdgeInsets.fromLTRB(10, 30, 0, 0)
                      ,child: Text(
                        "Set",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.blue[800],
                            fontSize: 35,
                            fontFamily: 'Cardo'
                        ),
                      ),),
                    Padding(padding: const EdgeInsets.fromLTRB(10, 5, 0, 0)
                      ,child: Text(
                        "my password",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.blue[800],
                            fontSize: 35,
                            fontFamily: 'Cardo'
                        ),
                      ),),
                    SizedBox(height: 10,),
                    Text("Please create a secure password including the following criteria below.",
                      style: TextStyle(fontFamily: 'ProductSans',fontSize: 16, height: 1.5, color: Colors.grey.shade600),),
                    SizedBox(height: 30,),
                    TextFormField(
                      onSaved: (String? value) {
                        newPass = value!;
                        print(newPass);
                      },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Can't be empty";
                          }
                        },
                      onChanged: (password) {
                        onPasswordChanged(password);
                        passv = password;},
                      obscureText: !_isVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },

                          icon: _isVisible ? Icon(Icons.visibility, color: Colors.black,) :
                          Icon(Icons.visibility_off, color: Colors.grey,),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)
                        ),
                        hintText: "Password",
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: _isPasswordEightCharacters ?  Colors.green : Colors.transparent,
                              border: _isPasswordEightCharacters ? Border.all(color: Colors.transparent) :
                              Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                        ),
                        SizedBox(width: 10,),
                        Text("Contains at least 8 characters",style: TextStyle(fontFamily: 'ProductSans'),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: _hasPasswordOneNumber ?  Colors.green : Colors.transparent,
                              border: _hasPasswordOneNumber ? Border.all(color: Colors.transparent) :
                              Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                        ),
                        SizedBox(width: 10,),
                        Text("Contains at least 1 number",style: TextStyle(fontFamily: 'ProductSans'),)
                      ],
                    ),
                    SizedBox(height: 30,),
                    TextFormField(
                      onSaved: (String? value) {
                        newPassR = value!;
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Can't be empty";
                        }
                      },
                      onChanged: (password) => passwordVerif(password, passv),
                      obscureText: !_isVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: _isVisible ? Icon(Icons.visibility, color: Colors.black,) :
                          Icon(Icons.visibility_off, color: Colors.grey,),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)
                        ),
                        hintText: "Repeat Password",
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: _isPasswordIdentic ?  Colors.green : Colors.transparent,
                              border: _isPasswordIdentic ? Border.all(color: Colors.transparent) :
                              Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                        ),
                        SizedBox(width: 10,),
                        Text("Passwords must match",style: TextStyle(fontFamily: 'ProductSans'),)
                      ],
                    ),

                    SizedBox(height: 50,),
                    Center(
                      child: InkWell(
                        onTap: ()async{
                        if(_keyForm.currentState!.validate()) {
                          _keyForm.currentState!.save();
                        }
                        if(_isPasswordEightCharacters && _hasPasswordOneNumber && _isPasswordIdentic){
                          Map<String, String> emailMap = {
                            "Password": newPass!
                          };
                          UserService().ResetPassword(emailMap, widget.mail, widget.token);
                         // Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                        }
                        else{
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                title: Text("Information"),
                                content: Text("You have to respect the criteria below !"),
                              );
                            },
                          );
                        }
                          setState(() {
                            isTrue = !isTrue;
                          });
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
            ),
          ],
        ),
      ),
    );
  }
}