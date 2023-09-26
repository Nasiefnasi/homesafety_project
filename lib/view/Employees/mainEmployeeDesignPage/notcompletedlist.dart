// ignore_for_file: unused_local_variable, unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';
import 'package:lottie/lottie.dart';

class NotCompletedlist extends StatelessWidget {
  const NotCompletedlist({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      drawer: const NewDrawer(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('NotCompleted')
            .where("emploid", isEqualTo: auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Loading indicator when waiting for data.
          }
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}"); // Handle errors.
          }
         if(!snapshot.hasData||snapshot.data!.docs.isEmpty){
                    return Center(child: Lottie.asset('asset/animation/Animation - 1695375830883.json'));

                  }
          return ListView.builder(
            itemBuilder: (context, index) {
              final data = snapshot.data!.docs[index];
              final document = data.data() as Map<String, dynamic>;

              // You might want to use the data from the snapshot here.
              // For example: snapshot.data!.docs[index]['fieldName']
              return NotCompletedListModel(data: document);
            },
            itemCount: snapshot.data!.docs.length ,
          );
        },
      )),
    );
  }
}
