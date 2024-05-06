// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class UserModel {
  String? id;
  String? username;
  String? email;
  String? phoneNumber;
  String? password;
  String? uid;
  String? fcmToken;
  String? address;
  String? fullName;
  String? phone ;
  String? role;
  RxInt unreadNotifications = RxInt(0);

  UserModel({
    required this.username,
    required this.id,
    required this.phoneNumber,
    required this.email,
    this.password,
    required this.uid,
    this.fcmToken,
    this.role,
    this.address,
    this.fullName,
    this.phone,
    int? unreadNotifications,
  }) {
    this.unreadNotifications.value = unreadNotifications ?? 0;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'phone': phoneNumber,
      'password': password,
      'address': address,
      'uid': uid,
      'fcmToken': fcmToken,
      'role': role,
      'fullName': fullName,
      'unreadNotifications': unreadNotifications.value,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    Logger().w(map);
    return UserModel(
      id: map['id'] as String,
      username: map['fullName'] as String?,
      email: map['username'] + "@gmail.com" as String?,
      phoneNumber: map['phone'] as String?,
      password: map['password'] != null ? map['password'] as String : null,
      fcmToken: map['fcmToken'] as String?,
      uid: map['uid'] as String,
      role: 'null',
      address: map['address'] as String?,
      fullName: map['fullName'] as String?,
      phone: map['phone'] as String?,
      unreadNotifications: map['unreadNotifications'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}