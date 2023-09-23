// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/controller/user/feedback/ratnigmodel.dart';

class Rating extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController feedbackss = TextEditingController();
  addratingfeedback(
    String userids,
    String? Employids,
    String? employurls,
    String userurls,
    String userNames,
  ) async {
    FeedBacks details = FeedBacks(
        Employid: Employids,
        userName: userNames,
        employurl: employurls,
        feedbacks: feedbackss.text,
        userid: userids,
        userurl: userurls);
    String uid = "${auth.currentUser!.uid}$Employids";
    await db.collection("EmployFeedback").doc(uid).set(details.toMap());
  }
}
