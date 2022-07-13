
import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Model/Complexe.dart';
import 'package:sportpal/Model/Matche.dart';
import 'package:sportpal/Model/Team.dart';
import 'package:sportpal/Model/Terrain.dart';

import '../Model/Player.dart';
import '../constants.dart';

class MatchService{

  final String _baseUrl = serverLocalhost+":3000";

  Future<List<Matche>?> getMatchs(String idUser) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    final List<Matche> matchs = [];


    final test = await http.get(Uri.http(_baseUrl, "/match/"+idUser), headers: headers)
        .then((http.Response response) async {
      if(response.statusCode == 200) {

        List<dynamic> matchData = await  json.decode(response.body);

        //List<Match> users = [];

        for(int i = 0; i < matchData.length; i++) {
          var lista = matchData[i]['teamA']['players'] as List;
          var listb = matchData[i]['teamB']['players'] as List;

          print( matchData.length);
          List<Player> imagesListA = lista.map((x) => Player.fromJson(x)).toList();
          List<Player> imagesListB = listb.map((x) => Player.fromJson(x)).toList();

          Team teamA   = Team(matchData[i]['teamA']['_id'],
              imagesListA,
              imagesListA[0],
              matchData[i]['teamA']['typeSport'],
              matchData[i]['teamA']['picture'],
              matchData[i]['teamA']['name'],
              matchData[i]['teamA']['description']);

          Team teamB   = Team(matchData[i]['teamB']['_id']
              ,imagesListB
              ,imagesListB[0]
              ,matchData[i]['teamB']['typeSport']
              ,matchData[i]['teamB']['picture']
              ,matchData[i]['teamB']['name']
              ,matchData[i]['teamB']['description']
          );
          Terrain terrain   = Terrain(matchData[i]['terrain']['_id'],matchData[i]['terrain']['name']
            ,matchData[i]['terrain']['description'],);


          matchs.add(Matche(matchData[i]['_id'],teamA,teamB,matchData[i]['winner'],matchData[i]['date'],matchData[i]['time'],terrain,matchData[i]['arbitre'],matchData[i]['scoreA'],matchData[i]['scoreB']));

        }

        print(response.body.toString());

        return matchs;

      } else if(response.statusCode == 500) {
        return matchs;
      }
    }
    );

    return matchs;

  }





  Future <bool> createIndivMatch(String teamA,String teamB, DateTime date,String terrain,String notifId) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    String datee = DateFormat("yyyy-MM-dd").format(date);
    String time = DateFormat.jms().format(date);
    Map<String,dynamic> body = {
      "teamA": teamA,
      "teamB": teamB,
      "date": datee,
      "time": time,
      "id": notifId,
      "terrain": terrain
    };

    print(body);

    final test = await http.post(Uri.http(_baseUrl, "/match/indivMatch"), headers: headers,body: json.encode(body))
        .then((http.Response response) async {
          print(response.body.toString());
      if (response.statusCode == 201) {
        return true;

      }
      // print("ena body"+response.body);
      // List<dynamic> complexeData = await  json.decode(response.body);
      // print(complexeData);
      // for(int i = 0; i < complexeData.length; i++) {
      //   //Map<String, dynamic> userData = newsData[i];
      //   //print(await newsData[i]["imageURL"]);
      //   var list = complexeData[i]['terrains']as List;
      //   print(list.length);
      //   //print("holle"+list.runtimeType.toString());
      //
      //   List<Terrain> terrainList = list.map((x) => Terrain.fromJson(x)).toList();
      //   print(terrainList);
      //   listComplexe.add(Complexe(complexeData[i]["_id"], complexeData[i]["owner"], terrainList,  complexeData[i]["address"],complexeData[i]["name"],complexeData[i]["picture"]));
      //
      // }
      // if(response.statusCode == 200) {
      //
      //   return await new Future(() => listComplexe);
      // }});
    });
    return false;

  }





}