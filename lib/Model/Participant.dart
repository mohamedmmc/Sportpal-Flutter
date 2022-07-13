import 'dart:ffi';

import 'Team.dart';

class Participant {
  final String? team;
  final int? points;
  final bool? isEliminated;

  Participant(this.team,this.points, this.isEliminated);

  Map<String, dynamic> toMap() {
    return {
      'team': team,
      'points': points,
      'isEliminated': isEliminated
    };
  }
  factory Participant.fromJson(dynamic json) {
    return Participant(json['team'] as String?, json['points'] as int?,json['isEliminated'] as bool?);
  }

}