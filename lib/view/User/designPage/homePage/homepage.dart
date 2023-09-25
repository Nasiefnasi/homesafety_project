// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/controller/user/chatpage/chating.dart'; 
import 'package:homesefty/core/size/colors&size.dart';
// import 'package:homesefty/model/User/homepage/homeScreeenTotalWork.dart';
import 'package:homesefty/model/User/homepage/statusleve.dart';
import 'package:homesefty/view/User/designPage/homePage/HomePageTotalWork.dart';
// import 'package:homesefty/view/User/designPage/homePage/homeScreeenTotalWork.dart';
import 'package:homesefty/view/User/drewer/drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    var mediaqury = MediaQuery.of(context);
    return Consumer<UserChating>(
      builder: (context, value, child) {
        return Scaffold(
          drawer: UserNewDrawer(colorss: Colors.accents),
          body: SafeArea(
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hight30,
                SizedBox(
                  // width: double.infinity,
                  // height: mediaqury.size.height * .13,
                  // color: Colors.amber,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,),
                    child: Text(
                      'Which service do you need?',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                hight10,
                Builder(
                  builder: (context) {
                    return SizedBox(
                      child: homeScreeenTotalWork(mediaqury: mediaqury),
                    );
                  }
                ),
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
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10))),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('conformwork')
                          .where("userid", isEqualTo: auth.currentUser?.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: const CircularProgressIndicator());
                        }
                        if (!snapshot.hasData ||
                            snapshot.data!.docs.isEmpty) {
                          return Expanded(
                              child: Container(
                                  color: Colors.white,
                                  child: Center(
                                      child: Lottie.asset(
                                    'asset/animation/Animation - 1695375830883.json',
                                  ))));
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          if (snapshot.hasData) {
                            return Container(width: double.infinity,height: 600,color: Colors.amber,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  final datass = snapshot.data!.docs[index];
                                  final document =
                                      datass.data() as Map<String, dynamic>;
                            
                                  return UserStatusLevel(datas: document);
                                },
                                itemCount: snapshot.data!.docs.length,
                              ),
                            );
                          } else {
                            return Center(child: const Text("Error"));
                          }
                        } else {
                          return Center(child: const Text("Error"));
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
