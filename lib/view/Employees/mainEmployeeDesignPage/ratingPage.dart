// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';
import 'package:homesefty/view/Employees/modelPage/employeRatingModelPage.dart';
import 'package:lottie/lottie.dart';

class RatingPag extends StatelessWidget {
  const RatingPag({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      drawer: const NewDrawer(),
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("EmployFeedback")
            .where("Employid", isEqualTo: auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("ERROR"),
            );
          }
          if(!snapshot.hasData||snapshot.data!.docs.isEmpty){
                    return Center(child: Lottie.asset('asset/animation/Animation - 1695375830883.json'));

                  }
          return ListView.builder(
            itemBuilder: (context, index) {
              final data = snapshot.data!.docs[index];
              final documents = data.data();
              return RatingEmployessPage(datas: documents);
            },
            itemCount: snapshot.data!.docs.length,
          );
        },
      )),
    );
  }
}
