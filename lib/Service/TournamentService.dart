import 'dart:ffi';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Model/Complexe.dart';
import 'package:sportpal/Model/Terrain.dart';
import 'package:sportpal/Model/Tournament.dart';
import 'package:sportpal/Model/User.dart';
import 'package:sportpal/variables.dart';
import '../Model/Matche.dart';
import '../Model/News.dart';
import '../Model/Participant.dart';
import '../Model/Player.dart';
import '../Model/Team.dart';
import '../constants.dart';
import '../main.dart';

class TournamentService{

  final String _baseUrl = serverLocalhost+":3000";


  Future<List<Tournament>> getTournament(List <Tournament> listTournament ) async {

    List<Matche>? matchList = [];


    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    final test = await http.get(Uri.http(_baseUrl, "/tournament/"), headers: headers)
        .then((http.Response response) async {
      List<dynamic> tournamentData = await  json.decode(response.body);
      print("Selected Sport:");
      print(selectedSport);
      for(int i = 0; i < tournamentData.length; i++) {
        List<Participant>? participantList = [];
        if(tournamentData[i]['typeSport']==selectedSport){
          print("Type de Sport");
          print(tournamentData[i]['typeSport']);

          if(tournamentData[i]['participants']!=null) {
            for (int j = 0; j < tournamentData[i]['participants'].length; j++) {
              Participant participant = Participant(
                  tournamentData[i]['participants'][j]['team'],
                  tournamentData[i]['participants'][j]['points'],
                  tournamentData[i]['participants'][j]['isEliminated']);
              participantList.add(participant);
            }
          }else{
            participantList = null;
          }
          /*   for( int j = 0; j < tournamentData[i]['matchs'].length; j++) {
          var lista = tournamentData[i]['matchs']['teamA']['players'] as List;
          var listb = tournamentData[i]['matchs']['teamB']['players'] as List;
          List<Player> imagesListA = lista.map((x) => Player.fromJson(x)).toList();
          List<Player> imagesListB = listb.map((x) => Player.fromJson(x)).toList();
          Team teamA   = Team(tournamentData[i]['matchs'][j]['teamA']['_id'],imagesListA,imagesListA[0],tournamentData[i]['matchs'][j]['teamA']['typeSport'],tournamentData[i]['matchs'][j]['teamA']['picture']);
          Team teamB   = Team(tournamentData[i]['matchs'][j]['teamB']['_id'],imagesListB,imagesListB[0],"","");
          Matche match = Matche(
              tournamentData[i]['matchs'][j]['_id'],
              null,
              null,
              tournamentData[i]['matchs'][j]['winner'],
              tournamentData[i]['matchs'][j]['date'],
              tournamentData[i]['matchs'][j]['time'],
          tournamentData[i]['matchs'][j]['terrain'] as Terrain,
          null,
              null,
          null);
          matchList.add(match);
        }*/
          //owner.email=tournamentData[i]['owner'][i]['email'];
          User owner = User(tournamentData[i]['owner']['_id'].toString(),tournamentData[i]['owner']['fullName'].toString(),tournamentData[i]['owner']['birthDate'].toString(),tournamentData[i]['owner']['email'].toString(),null,tournamentData[i]['owner']['telNum'].toString(),null,null,tournamentData[i]['owner']['address'].toString(),tournamentData[i]['owner']['gender'].toString(),tournamentData[i]['owner']['type'].toString(),null);
          Complexe complexe = Complexe(tournamentData[i]['place']['_id'].toString(), tournamentData[i]['place']['owner'].toString(), null, tournamentData[i]['place']['address'].toString(), tournamentData[i]['place']['name'].toString(), tournamentData[i]['place']['picture'].toString());
          print(owner.email);
          // Team team = Team(tournamentData[i]["participants"]["team"]as team)
          listTournament.add(Tournament(tournamentData[i]["_id"],tournamentData[i]["title"],tournamentData[i]["typeSport"],tournamentData[i]["type"],tournamentData[i]["numberOfParticipants"],owner,participantList,null,null,tournamentData[i]["prize"],tournamentData[i]["from"].toString(),tournamentData[i]["to"].toString(),complexe,tournamentData[i]["entriePrice"],tournamentData[i]["creditCard"]));

        }}
      if(response.statusCode == 200) {
        return await Future(() => listTournament);
      }});
    return listTournament;
  }
  Future<String?> addTeamToTournament(idTournament, idTeam) async {
    final test = await http.patch(Uri.http(_baseUrl, "/tournament/" + idTournament+"/"+idTeam)).then((http.Response response)  async {
      print(response.statusCode);
      if (response.statusCode == 200) {
        return await Future(() => "Team added");
      }else if(response.statusCode == 403){
        return await Future(() => "duplicated");
      }else{
        return await Future(() => "erreur");
      }
    });
    return test;


  }

}