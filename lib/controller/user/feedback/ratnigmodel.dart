// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class FeedBacks {
  String? userid;
  String? Employid;
  String? employurl;
  String? feedbacks;
  String? userurl;
  String? userName;
  FeedBacks(
      {required this.Employid,
      required this.userName,
      required this.employurl,
      required this.feedbacks,
      required this.userid,
      required this.userurl});
  factory FeedBacks.tomap(DocumentSnapshot map) {
    return FeedBacks(
        Employid: map[' Employid'],
        userName: map[' userName'],
        employurl: map[' employurl'],
        feedbacks: map[' feedbacks'],
        userid: map[' userid'],
        userurl: map[' userurl']);
  }
  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'Employid': Employid,
      'employurl': employurl,
      'feedback': feedbacks,
      'userurl': userurl,
      'userName': userName,
    };
  }
}
