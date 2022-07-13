import 'package:sportpal/Model/Participant.dart';
import 'package:sportpal/Model/Team.dart';
import 'package:sportpal/Model/Matche.dart';
import 'package:sportpal/Model/Complexe.dart';

import 'User.dart';


class Tournament {
  final String? id;
  final String? title;
  final String? typeSport;
  final String? type;
  final int? numberOfParticipants;
  final User? owner;
  final List<Participant?>? participants;
  final List<Matche?>? matchs;
  final Team? winner;
  final int? prize;
  final String? from;
  final String? to;
  final Complexe? place;
  final int? entriePrice;
  final String? creditCard;

  Tournament(this.id, this.title, this.typeSport,this.type, this.numberOfParticipants,this.owner, this.participants,this.matchs, this.winner, this.prize, this.from, this.to,this.place,this.entriePrice,this.creditCard);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'title': title,
      'typeSport': typeSport,
      'type': type,
      'numberOfParticipants': numberOfParticipants,
      'owner':owner,
      'participants': participants,
      'matchs': matchs,
      'winner': winner,
      'prize': prize,
      'from': from,
      'to': to,
      'place':place,
      'entriePrice':entriePrice,
      'creditCard':creditCard
    };
  }
  factory Tournament.fromJson(dynamic json) {
    return Tournament(json['_id'] as String?, json['title'] as String?,json['typeSport'] as String?
        ,json['type'] as String?, json['numberOfParticipants'] as int?, json['owner'] as User?,json['participants'] as List<Participant?>?, json['matchs'] as List<Matche?>?,
        json['winner'] as Team?, json['prize'] as int?, json['from'] as String?, json['to'] as String?, json['place'] as Complexe?,json['entriePrice'] as int?,json['creditCard'] as String?);
  }

}