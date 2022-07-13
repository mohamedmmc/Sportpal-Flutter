
import 'package:sportpal/Model/Terrain.dart';

class Complexe {
  final String? id;
  final String? owner;
  final List<Terrain>? terrains;
  final String? address;
  final String? name;
  final String? picture;


  Complexe(this.id, this.owner, this.terrains, this.address,this.name,this.picture);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'fullName': owner,
      'birthDate': terrains,
      'email': address,
      'password': name,
      'picture': picture
    };
  }
  factory Complexe.fromJson(dynamic json) {
    return Complexe(json['_id'] as String?, json['owner'] as String?, json['terrains'] as List<Terrain>?,json['address'] as String?, json['name'] as String?, json['picture'] as String?);
  }

}