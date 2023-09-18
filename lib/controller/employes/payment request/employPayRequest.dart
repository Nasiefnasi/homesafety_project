// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:homesefty/VIEW/Employees/payment/paymentRequestPage.dart';
import 'package:homesefty/controller/employes/payment%20request/paymentRequestmodel.dart';

class EmployPayRequest extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController usernames = TextEditingController();
  TextEditingController decorations = TextEditingController();
  TextEditingController works = TextEditingController();
  TextEditingController payments = TextEditingController();
  // String? emploid;
  // String? employUrl;
  // String? employename;
  // String? useerId;
  // String? username;
  // String? userUrl;

  adddata(String? emploid, String? employUrl, String? employename,
      String? useerId, String? username, String? userUrl) {
    String uid = "${auth.currentUser!.uid}$useerId";
    PaymentRequestModel paymentmodel = PaymentRequestModel(
        description: decorations.text.toString(),
        employImageUrl: employUrl,
        employName: employename,
        employid: auth.currentUser!.uid,
        payment: payments.text.toString(),
        userid: useerId,
        userImageUrl: userUrl,
        username: username,
        work: works.text.toString());
    db.collection("Paymentrequest").doc(uid).set(paymentmodel.toMap());
  }
}
