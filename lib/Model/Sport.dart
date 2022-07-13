



class Sport {
  final String? sport;
  final String? strongLeg;
  final String? strongHand;
  final String? favCourt;
  final String? knowledge;
  final String? idol;

  Sport(this.sport, this.strongLeg, this.strongHand, this.favCourt, this.knowledge, this.idol);

  Map<String, dynamic> toMap() {
    return {
      'sport': sport,
      'strongLeg': strongLeg,
      'strongHand': strongHand,
      'favCourt': favCourt,
      'knowledge': knowledge,
      'idol': idol,
    };
  }
  factory Sport.fromJson(dynamic json) {
    return Sport(json['sport'] as String?, json['strongLeg'] as String?,json['strongHand'] as String?, json['favCourt'] as String?, json['knowledge'] as String?, json['idol'] as String?);
  }

}