// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/VIEW/User/uesrtextformfield/paymentrequest.dart';
// ignore: unused_import
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'payment Requst',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: Container(
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
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Text("No data available");
              }
              return ListView.builder(
                  itemBuilder: (context, index) {
                    final datas = snapshot.data!.docs[index];
                    final doument = datas.data() as Map<String,dynamic> ;
            return UserPaymentRequestListModels(data:doument );
                  },
                  itemCount:snapshot.data!.docs.length ,
                );
            },
          )
          
            ),
          )
        ],
      )),
    );
  }
}
