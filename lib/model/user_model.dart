import 'dart:core';

class UserModel {
  String name;
  String email;
  String profilePic;
  String id;

  UserModel( {required this.name,
    required this.email,
    required this.profilePic,
    required this.id});

  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(name: map['displayName'] ?? '',
        email: map['email'] ?? '',
        profilePic: map['photoUrl'] ?? '',
        id: map['id'] ?? "",);
  }

  Map<String,dynamic> toMap(){
    return {
      'displayName': name,
      'email': email,
      'photoUrl':profilePic,
      'id' : id,
    };
  }
}