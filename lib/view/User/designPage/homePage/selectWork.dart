// ignore_for_file: unused_local_variable, avoid_unnecessary_containers, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/VIEW/User/designPage/navBar/navbar.dart';
import 'package:homesefty/core/size/colors&size.dart';

class UserWorkNotCompleted extends StatelessWidget {
  const UserWorkNotCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return BottoNavBar();
                },
              ));
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: const Text("Not Completed"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
                child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('NotCompleted')
                  .where("userId", isEqualTo: auth.currentUser?.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // No need to wrap it in Expanded
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Text(
                      'No data available'); // Change 'data' to a more descriptive message
                }

                // Data is available, create a ListView.builder
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final datass = snapshot.data!.docs.first;
                    final document = datass.data() as Map<String, dynamic>;
                    return SelectWorkmodel(details: document);
                  },
                );
              },
            )),
          )
        ],
      )),
    );
  }
}
// ignore_for_file: file_names

class SelectWorkmodel extends StatelessWidget {
  const SelectWorkmodel({super.key, required this.details});
  final Map<String, dynamic> details;

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    var _mediaQury = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        // height: mediaqury.height *.15,
        // color: Colors.amber,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            shadowColor: Colors.teal,
            elevation: 5,
            color: const Color.fromARGB(255, 233, 230, 230),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Width10,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                          radius: 25,
                          child: CircleAvatar(
                            radius: 33,
                            backgroundImage:
                                NetworkImage(details['usernameurl']),
                            backgroundColor: Colors.transparent,
                          )),
                    ),
                    Width10,
                    SizedBox(
                      // color: Colors.amber,
                      width: 150,
                      child: Text(
                        details['username'],
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        // color: Colors.amber,
                        width: 100,
                        child: Text(
                          'Not completed',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    child: Card(
                      color: const Color.fromARGB(255, 187, 187, 184),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          details['comment'],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
    //
    //
    //
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Container(
    //     decoration: const BoxDecoration(
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.grey, //New
    //           blurRadius: 15.0,
    //         )
    //       ],
    //     ),
    //     width: _mediaQury.size.width * .10,
    //     height: _mediaQury.size.height * .15,
    //     // color: Colors.amber,
    //     child: Card(
    //       shape:
    //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //       child: Wrap(
    //         // mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Row(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: SizedBox(
    //                     width: 80,
    //                     height: 90,
    //                     // color: Colors.amber,
    //                     child: ClipRRect(
    //                       borderRadius:
    //                           BorderRadius.circular(20), // Image border
    //                       child: SizedBox.fromSize(
    //                         size: const Size.fromRadius(48), // Image radius
    //                         child: Image.network('${details['employenameurl']}',
    //                             fit: BoxFit.cover),
    //                       ),
    //                     )
    //                     // CircleAvatar(  child: ClipOval(child: Image.network(details['userimagurl'] ,)),
    //                     //   radius: 90,
    //                     // ),
    //                     ),
    //               ),
    //               Width10,
    //               Card(
    //                 // color: Colors.amber,
    //                 // width: 260,
    //                 // height: _mediaQury.size.height * .2,
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     hight20,
    //                     Text(
    //                       'Name :  ${details['employename'].toString()}',
    //                       style: const TextStyle(
    //                         fontSize: 15,
    //                       ),
    //                     ),
    //                     hight10,
    //                     Text(
    //                       'phone :  ${details['employephonenumber']}',
    //                       style: const TextStyle(
    //                         fontSize: 15,
    //                       ),
    //                     ),
    //                     hight10,
    //                     Text(
    //                       'Time :   ${details['workdate'].toString()}',
    //                       style: const TextStyle(
    //                         fontSize: 15,
    //                       ),
    //                     ),
    //                     // hight10,
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //           // SizedBox(
    //           //   width: double.infinity,
    //           //   // color: Colors.black,
    //           //   height: _mediaQury.size.height * .05,
    //           //   child: Row(
    //           //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           //       children: [
    //           //         SizedBox(
    //           //           width: _mediaQury.size.width * 0.4,
    //           //           child: ElevatedButton(
    //           //               style: ElevatedButton.styleFrom(
    //           //                 backgroundColor: Colors.green,
    //           //                 shape: RoundedRectangleBorder(
    //           //                   borderRadius:
    //           //                       BorderRadius.circular(50), // <-- Radius
    //           //                 ),
    //           //               ),
    //           //               onPressed: () {},
    //           //               child: const Icon(Icons.message_sharp)),
    //           //         ),
    //           //       ]),
    //           // )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
