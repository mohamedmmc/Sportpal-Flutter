



import 'package:sportpal/Model/Player.dart';

import 'User.dart';

class Team {
  final String? id;
  final List<Player?> players;
  final Player? captain;
  final String? typeSport;
  final String? picture;
  final String? name;
  final String? description;


  Team(this.id, this.players, this.captain, this.typeSport, this.picture, this.name, this.description);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'players': players,
      'captain': captain,
      'picture': picture,
      'typeSport': typeSport,
      'name': name,
      'description': description
    };
  }
  factory Team.fromJson(dynamic json) {
    return Team(json['id'] as String?, json['players'] as  List<Player?>,json['captain'] as Player?, json['typeSport'] as String?, json['picture'] as String?, json['name'] as String?, json['description'] as String?);
  }

}