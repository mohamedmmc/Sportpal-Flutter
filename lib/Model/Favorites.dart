import 'package:sportpal/Model/Player.dart';

import 'Matche.dart';
import 'User.dart';

class Favorites {
  final User? player;
  final String? id;
  final List<Matche?> match;
  final List<String?>  tournament;



  Favorites(this.player, this.match, this.tournament, this.id);

  Map<String, dynamic> toMap() {
    return {
      'player': player,
      'match': match,
      'tournament': tournament,
      'id': id
    };
  }
  factory Favorites.fromJson(dynamic json) {
    return Favorites(json['player'] as User?, json['match'] as  List<Matche?>,json['tournament'] as  List<String?>, json['_id'] as String?);
  }

}