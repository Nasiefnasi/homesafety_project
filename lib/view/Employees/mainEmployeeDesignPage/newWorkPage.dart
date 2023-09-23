// ignore_for_file: file_names, avoid_unnecessary_containers, unnecessary_cast

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/workConformationpage.dart';
import 'package:homesefty/view/Employees/modelPage/newWorks.dart';
import 'package:lottie/lottie.dart';

class NewWorkPage extends StatefulWidget {
  const NewWorkPage({super.key});

  @override
  State<NewWorkPage> createState() => _NewWorkPageState();
}

class _NewWorkPageState extends State<NewWorkPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NewDrawer(),
      // appBar: AppBar(
      //   title: const Center(child: Text('New Works')),
      //   actions: [const Icon(Icons.dashboard_customize_rounded)],
      //   leading: IconButton(
      //       onPressed: () {}, icon: const Icon(Icons.arrow_circle_left_sharp)),
      // ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('SelectWork')
                    .doc("selct")
                    .collection('Electronics')
                    .where('employid', isEqualTo: auth.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if(!snapshot.hasData||snapshot.data!.docs.isEmpty){
                    return Center(child: Lottie.asset('asset/animation/Animation - 1695375830883.json'));

                  }
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final datass = snapshot.data!.docs[index];
                          final document =
                              datass.data() as Map<String, dynamic>;
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          WorkConformationpage(datas: document),
                                    ));
                              },
                              child: NewworkModel(details: document));
                        },
                        itemCount: snapshot.data!.docs.length,
                      );
                    } else {
                      return const Text('data');
                    }
                  }
                  return const Text('Error');
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
