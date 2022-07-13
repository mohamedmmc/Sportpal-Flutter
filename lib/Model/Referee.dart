import 'dart:ffi';

import 'package:sportpal/Model/User.dart';

class Referees extends Referee {
  final List<Referee>? referee;

  Referees(this.referee)
      : super(null, null, null, null, null, null, null, null, null, null, null,
      null, null, null, null, null,null);
}

class Referee extends User {
  final int? price;
  final String? file;
  final String? rating;
  final bool? available;
  final List? sports;

  Referee(
      this.price,
      this.file,
      this.rating,
      this.available,
      this.sports,
      _id,
      fullName,
      email,
      password,
      telNum,
      profilePic,
      isVerified,
      address,
      birthDate,
      gender,
      type,friends)
      : super(_id, fullName, email, password, telNum, profilePic, isVerified,
      address, birthDate, gender, type,friends);

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
      'sports': sports,
      'rating': rating,
      'available': available,
      'price': price,
      'file': file,
      'friends': friends,

    };
  }

  factory Referee.fromJson(Map<String, dynamic> json) {
    return Referee(
        json['price'] as int?,
        json['file'] as String?,
        json['rating'] as String?,
        json['available'] as bool?,
        json['sports'] as List?,
        json['_id'] as String?,
        json['fullName'] as String?,
        json['email'] as String?,
        json['password'] as String?,
        json['telNum'] as String?,
        json['profilePic'] as String?,
        json['isVerified'] as bool?,
        json['address'] as List?,json['friends'] as List?,
        json['birthDate'] as String?,
        json['gender'] as String?,
        json['type'] as String?);
  }
}