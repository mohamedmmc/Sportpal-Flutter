import 'package:flutter/material.dart';
import 'package:sportpal/Controller/authentification/signUp/Sage.dart';
import '../authentificationWidgets/Widgets/customInputBox.dart';




class RegisterName extends StatefulWidget {
  const RegisterName({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  _RegisterNameState createState() => _RegisterNameState();
}

class _RegisterNameState extends State<RegisterName> {
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;



    String _name = "";


    return Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25,),
              Padding(padding: const EdgeInsets.fromLTRB(30, 60, 0, 0)
                ,child: Row(
                  children: [
                    Text(
                      "My"
                          "\nName is",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Color (0xff0f5eba),
                          fontSize: 35,
                          fontFamily: 'Cardo'
                      ),
                    ),
                    SizedBox(width: 60,),
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
              SizedBox(height: 100,),
              Padding(
                padding:  EdgeInsets.fromLTRB(20, 0, 20, 15),
                child: TextFormField(
                  onChanged: (String? value){
                    if(value!.isNotEmpty){
                      _continueBtnColor();
                    }else{
                      _continueBtnColor2();
                    }
                  },
                  maxLength: 20,
                  keyboardType: TextInputType.text,
                  validator: (String? value ){
                    if (value!.isEmpty){
                      return 'name is required';
                    }
                  },
                  onSaved: (String? value){
                    _name = value!;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
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
              SizedBox(height: 10,),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'This is how you will appear in SportPAL ',
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff8f9db5).withOpacity(0.65),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 165,),
              Center(
                child: InkWell(
                  onTap: (){
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterAge(email: widget.email,name: _name,)));
                      _formKey.currentState!.save();

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
    );
  }
}
