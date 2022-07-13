import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportpal/Controller/authentification/signUp/SprofileSelect.dart';
import 'package:sportpal/Controller/chooseCategory.dart';
import 'package:sportpal/Service/FacebookSignIn.dart';
import 'package:sportpal/Service/UserService.dart';
import 'package:sportpal/Controller/authentification/signUp/ForgotPass/ForgotPass.dart';
import 'package:sportpal/Controller/authentification/signUp/Semail.dart';




import '../../Service/GoogleSignInProvider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late String? _username;
  late String? _password;

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  bool _isVisible = false;

  @override

  final Color facebookColor = const Color(0xff1e2757);
  final Color twitterColor = const Color(0xff00ABEA);
  final Color instaColor = const Color(0xffBE2289);
  final Color whatsappColor = const Color(0xff075E54);
  final Color linkedinColor = const Color(0xff0085E0);
  final Color githubColor = const Color(0xff202020);
  final Color googleColor = const Color(0xffDF4A32);

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    height: 300,
                    width: width+20,
                    child: Container(

                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/logologin1.jpeg'),
                              fit: BoxFit.fill

                          ),
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 8,),
                  Text("Welcome back", style: TextStyle(color: Color(0xff0f5eba), fontWeight: FontWeight.bold, fontSize: 34),),
                  SizedBox(height: 30,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(196, 135, 198, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ]
                    ),
                    child: Form(
                      key: _keyForm,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(
                                    color: (Colors.grey[200])!
                                ))
                            ),
                            child: TextFormField(
                              onSaved: (String? value) {
                                _username = value;
                              },
                              validator: (String? value) {
                                if(value == null || value.isEmpty) {
                                  return "Can't be empty";
                                }
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Username",
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              onSaved: (String? value) {
                                _password = value;
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Can't be empty";
                                }
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
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPass()));
                      },
                      child: Center(
                          child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(196, 135, 198, 1)),)
                      )
                  ),
                  SizedBox(height: 15,),
                  InkWell(
                    onTap: () async{
                      if(_keyForm.currentState!.validate()) {
                        _keyForm.currentState!.save();

                        Map<String, dynamic> userData = {
                          "email": _username,
                          "password": _password
                        };
                        var test = await UserService().login(userData);
                        if (test == "pass"){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                title: Text("Information"),
                                content: Text("Incorrect password !"),
                              );
                            },
                          );
                        }else if(test == "mail"){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                title: Text("Information"),
                                content: Text("Incorrect email !"),
                              );
                            },
                          );
                        }else{
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseCategory()));
                        }
                      }

                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff1e2757), Color(0xff2095f3)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(49, 39, 79, 1),
                      ),
                      child: Center(
                        child: Text("Login", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterEmail()));
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                        border: Border.all(
                        ),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text("Sign up", style: TextStyle(color: Color.fromRGBO(49, 39, 79, 1)),),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialButtonCircle(
                          facebookColor, FontAwesomeIcons.facebookF,
                          iconColor: Colors.white, onTap: () async {
                        var userfacebook = await   FacebookSignIn().signInWithFacebook();
                        if (userfacebook?.user?.email !=null  ) {
                          var userservice = await UserService().CheckMail(userfacebook!.user!.email!);
                          if(userservice.toString()   == "good"){
                            //Image _image = Image.network(userfacebook!.user!.photoURL!);
                            XFile? _xFile ;
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterProfileSelect( email: userfacebook.user!.email!, name: userfacebook.user!.displayName!, phone: "", gender: "", password: "",birthDate: "",)));
                          }else{
                            UserService().login(userservice);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseCategory()));

                          }
                        }else{
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                title: Text("Information"),
                                content: Text("Error communicating with Facebook !"),
                              );
                            },
                          );
                        }

                      }),
                      SizedBox(width: 60,),
                      socialButtonCircle(
                          googleColor, FontAwesomeIcons.googlePlusG,
                          iconColor: Colors.white, onTap: () async {
                        var UserGoogle = await   GoogleSignInProvider().signup(context);
                        if (UserGoogle!.email  !=null  ) {
                          var userservice = await UserService().CheckMail(UserGoogle.email! );
                          if(userservice.toString()   == "good"){
                            //Image _image = Image.network(userfacebook!.user!.photoURL!);
                            XFile? _xFile ;
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterProfileSelect( email: UserGoogle.email!, name: UserGoogle.displayName!, phone: "", gender: "", password: "",birthDate: "",)));
                          }else{
                            UserService().login(userservice);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseCategory()));

                          }
                        }else{
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                title: Text("Information"),
                                content: Text("Error communicating with Facebook !"),
                              );
                            },
                          );
                        }
                      }),
                      SizedBox(width: 60,),
                      socialButtonCircle(
                          whatsappColor, FontAwesomeIcons.whatsapp,
                          iconColor: Colors.white, onTap: () async {
                        var UserGoogle = await   GoogleSignInProvider().signOut();
                        Fluttertoast.showToast(msg: 'I am circle whatsapp');
                      }),


                    ],
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            )
          ],
        ),
      ),
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
