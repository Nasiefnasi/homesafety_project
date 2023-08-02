// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  // ignore: non_constant_identifier_names
  String? Username;
  String? email;

  UserModel({
    this.id,
    this.Username,
    this.email,
  });
  factory UserModel.formMap(DocumentSnapshot map) {
    return UserModel(
        email: map["email"], Username: map["uesrname"], id: map.id);
  }
  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "username": Username,
    };
  }
}
