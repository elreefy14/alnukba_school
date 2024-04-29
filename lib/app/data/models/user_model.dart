// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:logger/logger.dart';

class UserModel {
  String? id;
  String? username;
  String? email;
  String? phoneNumber;
  //String? imageUrl;
  String? password;
  //String? state;
  //String? municipality;
  String? uid;
  String? fcmToken;
  String? address;
  String? fullName;
  String? phone ;
  String? role;

  UserModel({
    required this.username,
    required this.id,
    required this.phoneNumber,
    required this.email,
    this.password,

    //required this.state,
   // required this.municipality,
    required this.uid,
   // required this.imageUrl,
    this.fcmToken,
     this.role,
    //  String? address;
  //String? fullName;
  //String? phone ;
  this.address,
  this.fullName,
  this.phone,
    

  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
/*
  String id;
  String? username;
  String? email;
  String? phoneNumber;
  String? imageUrl;
  String? password;
  String? state;
  String? municipality;
  String uid;
  String? fcmToken;
  String? address;
  String? fullName;
  String? phone ;
*/
      'id': id,
      'username': username,
      'email': email,
      'phone': phoneNumber,
     // 'imageUrl': imageUrl,
      'password': password,
      'address': address,
     // 'state': state,
     // 'municipality': municipality,
      'uid': uid,
      'fcmToken': fcmToken,
      'role': role,
      'fullName': fullName,
      
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    Logger().w(map);
    return UserModel(
      id: map['id'] as String,
      username: map['fullName'] as String?,
     // imageUrl: map['imageUrl'] as String?,
      email: map['username'] + "@gmail.com" as String?,
      phoneNumber: map['phone'] as String?,
      password: map['password'] != null ? map['password'] as String : null,
    //  state: map['address'] as String?,
    //  municipality: map['municipality'] as String?,
      fcmToken: map['fcmToken'] as String?,
      uid: map['uid'] as String,
      role: 'null',
      address: map['address'] as String?,
      fullName: map['fullName'] as String?,
      phone: map['phone'] as String?,

    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
