import 'package:flutter/material.dart';




class ButtonHeaderWidget extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onClicked;
  const ButtonHeaderWidget({Key? key,required this.title,required this.text,required this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeaderWidget(
      title:title,
      child:ButtonWidget(
        text:text,
        onClicked:onClicked,
      )
    );
  }
}
class HeaderWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const HeaderWidget({Key? key,required this.title,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 12,),
              Container(
                child: Text(
                  title,style: TextStyle(
                  color: Colors.black,
                  fontSize: 24
                ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8,),
          child
        ],
      ),
    );
  }
}


class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const ButtonWidget({Key? key,required this.text,required this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClicked,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black
            ),
          ),

        ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(40),
          primary: Colors.white
      ),
    );

  }
}
