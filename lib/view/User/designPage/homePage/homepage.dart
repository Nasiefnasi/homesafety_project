// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:homesefty/model/User/homepage/homeScreeenTotalWork.dart';
import 'package:homesefty/model/User/homepage/statusleve.dart';
import 'package:homesefty/view/User/designPage/homePage/HomePageTotalWork.dart';
// import 'package:homesefty/view/User/designPage/homePage/homeScreeenTotalWork.dart';
import 'package:homesefty/view/User/drewer/drawer.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    var mediaqury = MediaQuery.of(context);
    return Scaffold(
      drawer: UserNewDrawer(colorss: Colors.accents),
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: 80,
                height: 80,
                child: Image.asset('asset/animation/LOGO-01.png'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: mediaqury.size.height * .10,
              // color: Colors.amber,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Which service do you \nneed?',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
                width: mediaqury.size.width * 9,
                // color: Colors.red,
                height: mediaqury.size.height * .35,
                child: homeScreeenTotalWork(mediaqury: mediaqury)),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'STATUS LEVEL',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromARGB(255, 40, 116, 42)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                                  .collection('conformwork')
                                  .where("userid",
                                      isEqualTo: auth.currentUser?.uid)
                                  .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return const UserStatusLevel();
                            },
                            itemCount: snapshot.data!.docs.length,
                          );
                        } else {
                          return Text("Error");
                        }
                      } else {
                        return Text("Error");
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
