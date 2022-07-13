



import 'package:sportpal/Model/Team.dart';
import 'package:sportpal/Model/Terrain.dart';

class Matche {
  final String? id;
  final Team? teamA;
  final Team? teamB;
  final String? winner;
  final String? date;
  final String? time;
  final Terrain? terrain;
  final List<dynamic?>? arbitre;
  final List<dynamic?>? scoreA;
  final List<dynamic?>? scoreB;

  Matche(this.id, this.teamA, this.teamB, this.winner, this.date,this.time, this.terrain, this.arbitre, this.scoreA, this.scoreB);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'teamA': teamA,
      'teamB': teamB,
      'winner': winner,
      'date': date,
      'time': time,
      'terrain': terrain,
      'arbitre': arbitre,
      'scoreA': scoreA,
      'scoreB': scoreB,
    };
  }
  factory Matche.fromJson(dynamic json) {
    return Matche(json['_id'] as String?, json['teamA'] as Team?,json['teamB'] as Team?
        , json['winner'] as String?, json['date'] as String?,json['time'] as String?, json['terrain'] as Terrain?,
        json['arbitre'] as List<String?>?, json['scoreA'] as List<String?>?, json['scoreB'] as List<String?>?);
  }

}