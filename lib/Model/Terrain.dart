
class Terrain {
  final String? id;
  final String? typeSport;
  final String? picture;



  Terrain(this.id, this.typeSport, this.picture);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'typeSport': typeSport,
      'picture': picture,

    };
  }
  factory Terrain.fromJson(dynamic json) {
    return Terrain(json['_id'] as String?,json['typeSport'] as String?,json['picture'] as String?);
  }

}