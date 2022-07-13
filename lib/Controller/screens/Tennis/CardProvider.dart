import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sportpal/Model/TeamTinder.dart';
import 'package:sportpal/Service/NotificationService.dart';
import 'package:sportpal/variables.dart';

import '../../../Model/Player.dart';
import '../../../Model/User.dart';
import '../../../Model/UserTInder.dart';
import '../../../Service/PlayerService.dart';
import 'package:shared_preferences/shared_preferences.dart';
enum CardStatus { challenge, dislike, superlike }

class CardProvider extends ChangeNotifier {
  late String idtest;
  var a;
  int i = 0;
  int maxx = 0;


  late SharedPreferences prefs;
  Size _screenSize = Size.zero;

  List<User> _users = [];
  List<User> get users => _users;


  // for the teams :

  List<TeamTinder> _teams = [];
  List<TeamTinder> get teams => _teams;


  double _angle = 0;
  double get angle => _angle;

  Offset _position = Offset.zero;
  Offset get position => _position;
  bool _isDragging = false;
  bool get isDragging => _isDragging;

  CardProvider() {
    resetUsers();


    //resetTeams();
  }

  void setScreenSize(Size screenSize) => _screenSize = screenSize;
  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }
  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;

    notifyListeners();
  }
  void endPosition() {
    _isDragging = false;
    notifyListeners();

    final status = getStatus(force: true);

    if (status != null) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: status.toString().split('.').last.toUpperCase(), fontSize: 36);
    }

    switch (status) {
      case CardStatus.challenge:
        like();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      case CardStatus.superlike:
        superlike();
        break;
      default:
        resetPosition();
    }
  }
  double getStatusOpacity(){
    final delta = 100;
    final pos = max(_position.dx.abs(), _position.dy.abs());
    final opacity = pos /delta;
    return min(opacity,1);
  }
  CardStatus? getStatus({bool force = false}) {
    final x = _position.dx;
    final y = _position.dy;
    final forceSuperLike = x.abs() < 20;
    if (force){
      final delta = 100;
      if (x >= delta) {
        return CardStatus.challenge;
      }else if (x<=-delta){
        return CardStatus.dislike;
      }else if (y <= -delta / 2 && forceSuperLike){
        return CardStatus.superlike;
      }
    }else{
      final delta = 20;
      if (y <= -delta *2 && forceSuperLike) {
        return CardStatus.superlike;
      }else if (x>=delta){
        return CardStatus.challenge;
      }else if (x <= -delta){
        return CardStatus.dislike;
      }
    }
  }
  void like() async{
    //match


    _angle = 20;
    _position += Offset(2 * _screenSize.width / 2, 0);

    prefs = await SharedPreferences.getInstance();
    idtest = prefs.getString("_id")!;
    print("l'id est : "+(maxx -1).toString());
    var sendRequest = await NotificationService().friendRequest(idtest, a[maxx -1 ].id);
    print(sendRequest);

    _nextCard();
    notifyListeners();

  }
  void dislike(){
    _angle = -20;
    _position-= Offset(2 * _screenSize.width,0);
    _nextCard();
    notifyListeners();
  }
  void superlike(){

    _angle = 0;
    _position-= Offset(2 * _screenSize.height,0);
    _nextCard();
    notifyListeners();

  }


  Future _nextCard() async {

    if (_users.isEmpty) return;
    await Future.delayed(Duration(milliseconds: 200));
    maxx=maxx -1;
    _users.removeLast();
    resetPosition();
  }

  void resetPosition() {
    _position = Offset.zero;
    _isDragging = false;
    _angle = 0;
    notifyListeners();
  }

  void resetUsers() async{

    i=0;
    prefs = await SharedPreferences.getInstance();
    int ageNow = DateTime.now().year - DateTime.now().year ;

    idtest = prefs.getString("_id")!;

    List<User> getPlayerList = await PlayerService().getAllPlayers(idtest).then((value) {
      a = value?.toList(growable: true);
      print(a);
      maxx =a!.length;
      print("filtre gender : "+genderFilter);
      print("filtre type : "+type);
      _users.clear();
      a.forEach((element) {
        if ((element.birthDate?? "").isNotEmpty) {
          ageNow = DateTime.now().year - DateTime.parse(element.birthDate!).year ;
        }
        if(genderFilter.isEmpty && type.isEmpty && age==null) {
          _users.add(Player(
              element.team,
              element.sports,
              element.rating,
              element.description,
              element.id,
              element.fullName,
              element.email,
              element.password,
              element.telNum,
              element.profilePic,
              element.isVerified,
              element.address,
              element.birthDate,
              element.gender,
              element.type,
              element.friends));
        } else if (genderFilter == element.gender){
          _users.add(Player(
              element.team,
              element.sports,
              element.rating,
              element.description,
              element.id,
              element.fullName,
              element.email,
              element.password,
              element.telNum,
              element.profilePic,
              element.isVerified,
              element.address,
              element.birthDate,
              element.gender,
              element.type,
              element.friends));
        }else if (type == element.type){
          _users.add(Player(
              element.team,
              element.sports,
              element.rating,
              element.description,
              element.id,
              element.fullName,
              element.email,
              element.password,
              element.telNum,
              element.profilePic,
              element.isVerified,
              element.address,
              element.birthDate,
              element.gender,
              element.type,
              element.friends));
        }
        else if (age != null){
          if ((element.birthDate?? "").isNotEmpty) {
            ageNow = DateTime.now().year - DateTime.parse(element.birthDate!).year ;
            print(age!.start.round() > ageNow);
            if(age!.start.round() > ageNow && age!.end.round()< ageNow){
              _users.add(Player(
                  element.team,
                  element.sports,
                  element.rating,
                  element.description,
                  element.id,
                  element.fullName,
                  element.email,
                  element.password,
                  element.telNum,
                  element.profilePic,
                  element.isVerified,
                  element.address,
                  element.birthDate,
                  element.gender,
                  element.type,
                  element.friends));
            }
          }


        }


      });
      return _users; }
    );
    notifyListeners();
  }
}
