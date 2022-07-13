import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportpal/Model/TeamTinder.dart';

import '../../../Model/Player.dart';
import '../../../Model/User.dart';
import '../../../Model/UserTInder.dart';
import '../profil/aboutMe/aboutMeScreen.dart';
import 'CardProvider.dart';


class TinderCard extends StatefulWidget {
  final User? user;
  final TeamTinder? team;
  final bool isFront;

  const TinderCard({Key? key, required this.user,required this.isFront, this.team}) : super(key: key);

  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      final provider = Provider.of<CardProvider>(context,listen: false);
      provider.setScreenSize(size);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: widget.isFront ? buildFrontCard() : buildCard(),
    );
  }

  buildName() => Row(
        children: [
          Text(
            //selectedSport == "tennis" ?  widget.user!.name : widget.team!.name!,
            widget.user!.fullName!,
            style: TextStyle(
                fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 16,
          ),
          // Text(
          //   "${widget.user!.birthDate}",
          //   style: TextStyle(fontSize: 32, color: Colors.white),
          // )
        ],
      );

  Widget buildStatus() => Row(
        children: [
          Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.green),
            width: 12,
            height: 12,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            "Recently Active",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      );

  buildCard() {
    return InkWell(
      onTap: (){
        print("aaa");


        Navigator.push(context, MaterialPageRoute(builder: (context) => AboutMeScreen(idPlayer: widget.user!.id!,fullName:widget.user!.fullName! ,
          profilePic:widget.user!.profilePic! ,
          birthDate: widget.user!.birthDate,
          friends: widget.user!.friends!.length.toString(),
        )));
      },
      child: ClipRRect(

        borderRadius: BorderRadius.circular(20),
        child: Container(

          decoration: BoxDecoration(
            image: DecorationImage(

              image: NetworkImage(widget.user!.profilePic!),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1])),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Spacer(),
                  buildName(),
                  SizedBox(
                    height: 8,
                  ),
                  buildStatus()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildFrontCard() => GestureDetector(
        child: LayoutBuilder(
          builder: (context,constraints) {
            final provider = Provider.of<CardProvider>(context);
            final position = provider.position;
            final mil = provider.isDragging ? 0 : 400;
            final angle = provider.angle * pi /100;
            final center = constraints.smallest.center(Offset.zero);

            final rotatedMatrix = Matrix4.identity()
              ..translate(center.dx,center.dy)
              ..rotateZ(angle)
              ..translate(-center.dx,-center.dy);
            return AnimatedContainer(
              duration: Duration(milliseconds: mil),
              curve: Curves.easeInOut,
              transform: rotatedMatrix..translate(position.dx,position.dy),
              child: Stack(
                children: [
                  buildCard(),
                  buildStamps(),
                ],
              )
            );
          },
        ),
        onPanStart: (details) {
          final provider = Provider.of<CardProvider>(context,listen: false);
          provider.startPosition(details);
        },
        onPanUpdate: (details) {
          final provider = Provider.of<CardProvider>(context,listen: false);
          provider.updatePosition(details);
        },
        onPanEnd: (details) {
          final provider = Provider.of<CardProvider>(context,listen: false);
          provider.endPosition();
        },
      );

  buildStamps() {
    final provider = Provider.of<CardProvider>(context);
    final status = provider.getStatus();
    final opacity = provider.getStatusOpacity();

    switch (status){
      case CardStatus.challenge:
        final child = buildStamp(angle:-0.5,color: Colors.green,text:'CHALLENGE',opacity:opacity);
        return Positioned(top:64,left: 50,child: child);
      case CardStatus.dislike:
        final child = buildStamp(angle:0.5,color: Colors.red,text:'REFUSED',opacity:opacity);
        return Positioned(top:64,right: 50,child: child);
      case CardStatus.superlike:
        final child = buildStamp(color: Colors.blue,text:'SUPER LIKED',opacity:opacity);
        return Positioned(bottom:128,right: 0,left:0,child: child);
      default:
        return Container();
    }
  }

  buildStamp({double angle = 0, required Color color,required String text,required double opacity}) {
    return Opacity(
      opacity: opacity,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color,width: 4),
          ),
          child: Text(
            text,textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
