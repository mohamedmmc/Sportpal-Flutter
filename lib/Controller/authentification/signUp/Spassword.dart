import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sportpal/Controller/authentification/signUp/SprofileSelect.dart';
import 'package:sportpal/constants.dart';

class RegisterPassword extends StatefulWidget {
  const RegisterPassword({ Key? key, required this.photo, required this.email, required this.name, required this.phone, required this.gender, required this.birthDate }) : super(key: key);
  final XFile photo;
  final String email;
  final String name;
  final String phone;
  final String gender;
  final DateTime birthDate;


  @override
  _RegisterPasswordState createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
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
            SizedBox(height: 20),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: _keyForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: const EdgeInsets.fromLTRB(0, 40, 0, 0)
                      ,child: Row(
                        children: [
                          Text(
                            "Set"
                                "\nmy password",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: appcolor,
                                fontSize: 32,
                                fontFamily: 'Cardo'
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                image:
                                DecorationImage(image: NetworkImage("https://scontent.ftun8-1.fna.fbcdn.net/v/t1.15752-9/276125676_342231811294745_2822157271872426945_n.png?_nc_cat=106&ccb=1-5&_nc_sid=ae9488&_nc_ohc=Uwbhr5PlpPIAX-BiY-A&_nc_ht=scontent.ftun8-1.fna&oh=03_AVIaYxAH1AVLHbxVTYBnCrI8V-hJ-bV9TdPAtp_KRQv16w&oe=62987D8C"))),
                          )
                        ],
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
                      onChanged: (password) {
                        passwordVerif(password, passv);
                        setState(() {
                          if(_isPasswordIdentic){
                            isTrue = true;
                          }else{
                            isTrue = false;

                          }
                        });
                      },
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
                        onTap: ()async {
                          if(_keyForm.currentState!.validate()) {
                            _keyForm.currentState!.save();
                            if(_isPasswordEightCharacters && _hasPasswordOneNumber && _isPasswordIdentic){
                              Map<String, String> emailMap = {
                                "Password": newPass!
                              };
                              String age = DateFormat("yyyy-MM-dd").format(widget.birthDate);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterProfileSelect(gender: widget.gender,name: widget.name,email:widget.email ,phone:widget.phone ,photo:widget.photo,password: passv,birthDate: age, )));


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
                            gradient: LinearGradient(
                              colors: isTrue ? [Color(0xff1e2757), Color(0xff2095f3)] : [Colors.white, Colors.white],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
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