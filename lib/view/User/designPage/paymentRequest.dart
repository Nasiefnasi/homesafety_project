// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/VIEW/User/uesrtextformfield/paymentrequest.dart';
// ignore: unused_import
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:lottie/lottie.dart';
// import 'package:homesefty/view/User/uesrtextformfield/paymentrequest.dart';

class UserPaymentRequestPage extends StatelessWidget {
  const UserPaymentRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              // ignore: sized_box_for_whitespace
              child: Container(
                  width: 250,
                  height: 100,
                  child: Lottie.asset(
                    'asset/animation/Animation - 1695111137520.json',
                  ))),
          Expanded(
            child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                // color: Colors.amber,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Paymentrequest')
                      .where('userid', isEqualTo: auth.currentUser!.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Expanded(
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10))),
                              child: Center(
                                  child: Lottie.asset(
                                'asset/animation/Animation - 1695375830883.json',
                              ))));
                    }
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final datas = snapshot.data!.docs[index];
                        final doument = datas.data() as Map<String, dynamic>;
                        return UserPaymentRequestListModels(data: doument);
                      },
                      itemCount: snapshot.data!.docs.length,
                    );
                  },
                )),
          )
        ],
      )),
    );
  }
}
