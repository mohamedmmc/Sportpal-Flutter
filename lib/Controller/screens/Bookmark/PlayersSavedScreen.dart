import 'package:flutter/material.dart';



class PlayersSavedScreen extends StatefulWidget {
  const PlayersSavedScreen({Key? key}) : super(key: key);

  @override
  _PlayersSavedScreenState createState() => _PlayersSavedScreenState();
}

class _PlayersSavedScreenState extends State<PlayersSavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "Players",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50
        ),
        ),
      ),
    );
  }
}
