



import 'package:sportpal/Model/Terrain.dart';

import 'Player.dart';

class Notification {
  final String? id;
  final Player? from;
  final List<Player?> to;
  final String? description;
  final String? date;
  final String? type;
  final bool? sent;
  final bool accept;
  final String? terrain;


  Notification(this.id, this.from, this.to, this.description, this.date,this.sent,this.accept, this.type, this.terrain);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'from': from,
      'to': to,
      'description': description,
      'date': date,
      'sent': sent,
      'accept': accept,
      'typeNotification': type,
      'terrain': terrain
    };
  }
  factory Notification.fromJson(dynamic json) {
    return Notification(json['_id'] as String?,json['from'] as Player?, json['to'] as List<Player?>, json['description'] as String?,json['date'] as String?, json['sent'] as bool?,json['accept'] as bool,json['typeNotification'] as String?,json['terrain'] as String?);
  }

}