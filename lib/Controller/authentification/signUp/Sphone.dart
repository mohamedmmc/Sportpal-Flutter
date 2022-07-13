import 'package:flutter/material.dart';
import 'package:sportpal/Controller/authentification/signUp/Ssexe.dart';
import 'package:sportpal/constants.dart';




class RegisterPhone extends StatefulWidget {
  const RegisterPhone({Key? key, required this.email, required this.name,  this.birthDate}) : super(key: key);
final String email;
final String name;
final DateTime? birthDate;
  @override
  _RegisterPhoneState createState() => _RegisterPhoneState();
}

class _RegisterPhoneState extends State<RegisterPhone> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _checked = true;
  bool isTrue = false;
  Future<void> _continueBtnColor() async {
    setState(() {
      isTrue = true;
    });
  }
  Future<void> _continueBtnColor2() async {
    setState(() {
      isTrue = false;
    });
  }
  @override

  Widget build(BuildContext context) {

    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;


    String _phone = "";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key : _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25,),

              Padding(padding: const EdgeInsets.fromLTRB(30, 60, 0, 0)
                ,child: Row(
                  children: [
                    Text(
                      "Set phone"
                          "\nnumber",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: appcolor,
                          fontSize: 35,
                          fontFamily: 'Cardo'
                      ),
                    ),
                    SizedBox(width: 45,),
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
                ),),
              SizedBox(height: 70,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                child: TextFormField(
                  onChanged: (String? value){
                    if(value!.isNotEmpty){
                      _continueBtnColor();
                    }else{
                      _continueBtnColor2();
                    }
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Phone number is Required';
                    }

                    return null;
                  },
                  onSaved: (String? value) {
                    _phone = value!;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'phone',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    hintText: "XXXXXXXX",
                    hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[350],
                        fontWeight: FontWeight.w600),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 27, horizontal: 25),
                  ),
                ),
              ),


              SizedBox(height: 200,),
              CheckboxListTile(
                title: Text(
                    "This information will be public",
                    style: TextStyle(fontFamily: 'ProductSans',color: Colors.grey)
                ),
                secondary: Icon(Icons.public),
                controlAffinity: ListTileControlAffinity.leading,
                value: _checked,
                activeColor: Colors.green,
                checkColor: Colors.black,
                onChanged: (bool? value) {
                  setState(() {
                    _checked = value!;
                  });
                },
              ),
              Center(
                child: InkWell(
                  onTap: (){
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }else{

                      _formKey.currentState!.save();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterSexe(email: widget.email,name: widget.name,phone: _phone,birthDate: widget.birthDate!,)));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
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
    );
  }
}
