// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPersonalDetailget extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Map<String, dynamic> document = {};

  Future detailsFirebaseGetFunction() async {
    Map<String, dynamic> data;
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('userdetails')
          .where("id", isEqualTo: auth.currentUser!.uid)
          .get();

      if (snapshot.docs.isEmpty) {
        return;
      }

      data = snapshot.docs.first.data() as Map<String, dynamic>;

      notifyListeners();
    } catch (e) {
      Get.snackbar('Error', "${e}");
    }
  }
}
