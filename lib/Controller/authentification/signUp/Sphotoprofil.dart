import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Spassword.dart';





class RegisterPhotoprofil extends StatefulWidget {
  const RegisterPhotoprofil({Key? key, required this.email, required this.name, required this.gender, required this.phone, required this.birthDate}) : super(key: key);
  final String email;
  final String name;
  final String gender;
  final String phone;
  final DateTime birthDate;

  @override
  _RegisterPhotoprofilState createState() => _RegisterPhotoprofilState();
}

class _RegisterPhotoprofilState extends State<RegisterPhotoprofil> {
  bool isTrue = true;
  XFile? image;
  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if(image == null) return;
    final imageTemporary =  XFile(image.path);
    setState(() {
      this.image=imageTemporary;
    });
  }
  @override
  Widget build(BuildContext context) {

    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25,),
              Padding(padding: const EdgeInsets.fromLTRB(15 , 60, 0, 0)
            ,child: Row(
              children: [
                Text(
                  "Select your"
                      "\nprofil photo",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.blue[800],
                      fontSize: 35,
                      fontFamily: 'Cardo'
                  ),
                ),
                SizedBox(width: 30,),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      image:
                      DecorationImage(image: NetworkImage("https://scontent.ftun8-1.fna.fbcdn.net/v/t1.15752-9/276125676_342231811294745_2822157271872426945_n.png?_nc_cat=106&ccb=1-5&_nc_sid=ae9488&_nc_ohc=Uwbhr5PlpPIAX-BiY-A&_nc_ht=scontent.ftun8-1.fna&oh=03_AVIaYxAH1AVLHbxVTYBnCrI8V-hJ-bV9TdPAtp_KRQv16w&oe=62987D8C"))),
                )
              ],
            ),
        ),
              SizedBox(height: 40,),
              Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 20)
                ,child:
                  Center(
                    child:
                      Container(
                      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: image == null ? null : FileImage(File(image!.path)),
                      ),
                    ),)/* Container(
                        alignment: Alignment.center,
                        child:
                    image != null
                        ? Image.file(
                      File(image!.path),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,): FlutterLogo(size: 160),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                    ),
                  ) Center(
                  child:
                  image != null
                      ? Image.file(
                    File(image!.path),
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,): FlutterLogo(size: 160),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),*/

              ),
              SizedBox(height: 10,),
              InkWell(
                  onTap: (){ setState(() {
                    pickImage(ImageSource.gallery);
                });


                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    border: Border.all(
                    ),
                    borderRadius: BorderRadius.circular(50),
                    color: isTrue ?  Colors.white : Colors.white ,
                  ),
                  child: Center(
                    child: Text("Pick Gallery", style: TextStyle(
                      color: Color.fromRGBO(49, 39, 79, 1),
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 18,),
              InkWell(
                onTap: (){
                  setState(() {
                  pickImage(ImageSource.camera);
                });

                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    border: Border.all(
                    ),
                    borderRadius: BorderRadius.circular(50),
                    color: isTrue ?  Colors.white : Colors.white ,
                  ),
                  child: Center(
                    child: Text("Pick Camera", style: TextStyle(
                      color: Color.fromRGBO(49, 39, 79, 1) ,
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPassword(name: widget.name,gender: widget.gender,email: widget.email,phone: widget.phone,photo: image!,birthDate: widget.birthDate  ,)));
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
        )
  );
  }
}
