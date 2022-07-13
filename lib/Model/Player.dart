
import 'package:sportpal/Model/Sport.dart';
import 'package:sportpal/Model/User.dart';

class Players extends Player{
  final List<Player>? player;

  Players(this.player) : super(null, null, '', '', null, null, null, null, null, null, null, null, null, null, null,null);
}

class Player  extends User{
  final List? team;
  final List<dynamic>? sports;
  final String? rating;
  final String? description;

  Player(this.team, this.sports, this.rating,this.description,_id,fullName,email,password,telNum,profilePic,isVerified,address,birthDate,gender,type,friends) : super(_id,fullName, email, password, telNum, profilePic, isVerified, address, birthDate,gender, type,friends);

  Map<String, dynamic> toMap() {
    return {

      'fullName': fullName,
      'birthDate': birthDate,
      'email': email,
      'password': password,
      'telNum': telNum,
      'profilePic': profilePic,
      'isVerified': isVerified,
      'address': address,
      'gender': gender,
      'type': type,
      'team': team,
      'sports': sports,
      'rating': rating,
      'description': description,
      'friends': friends
    };
  }
  
  
  
  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(json['team'] as List?,json['sports'] as List<dynamic>?,json['rating'] as String?,json['description'] as String?,json['_id'] as String?, json['fullName'] as String?, json['email'] as String?,
      json['password'] as String?, json['telNum'] as String?,json['profilePic'] as String?,
      json['isVerified'] as bool?,json['address'] as List?, json['birthDate'] as String?, json['gender'] as String?, json['type'] as String?, json['friends'] as List?

    );
  }

}