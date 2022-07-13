
class User {
  final String? id;
  final String? fullName;
  final String? email;
  final String? password;
  final String? telNum;
  final String? profilePic;
  final bool? isVerified;
  final List? address;
  final String? birthDate;
  final String? gender;
  final String? type;
  final List? friends;

  User(this.id, this.fullName, this.email, this.password,this.telNum,this.profilePic,this.isVerified,this.address,this.birthDate,this.gender,this.type,this.friends);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
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
      'friends': friends
    };
  }
  factory User.fromJson(dynamic json) {
    return User(json['_id'] as String?, json['fullName'] as String?, json['email'] as String?,json['password'] as String?, json['telNum'] as String?,json['profilePic'] as String?, json['isVerified'] as bool?,json['address'] as List?, json['birthDate'] as String?,json['gender'] as String?, json['type'] as String?, json['friends'] as List?);
  }

}