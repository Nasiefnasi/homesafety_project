// ignore_for_file: unused_local_variable, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/core/size/colors&size.dart';

class SelectWork extends StatelessWidget {
  const SelectWork({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
              child:

                  //  StreamBuilder<QuerySnapshot>(
                  //                   stream: FirebaseFirestore.instance
                  //                       .collection('conformwork')
                  //                       .where("employid",
                  //                           isEqualTo: auth.currentUser?.uid)
                  //                       .snapshots(),
                  //                   builder: (context, snapshot) {
                  //                     if (snapshot.connectionState ==
                  //                         ConnectionState.waiting) {
                  //                       return CircularProgressIndicator();
                  //                     }
                  //                     if (snapshot.connectionState ==
                  //                         ConnectionState.active) {
                  //                       if (snapshot.hasData) {
                  //                         return ListView.builder(
                  //                           itemBuilder: (context, index) {
                  //                             final data =
                  //                                 snapshot.data!.docs[index];
                  //                             final datas = data.data()
                  //                                 as Map<String, dynamic>;
                  //                             // value.getreceiverId(data['userid']);

                  //                             return Padding(
                  //                               padding: EdgeInsets.only(top: 10),
                  //                               child: PandingworkStatusPPage(
                  //                                   data: datas),
                  //                             );
                  //                           },
                  //                           itemCount: snapshot.data!.docs.length,
                  //                           shrinkWrap: false,
                  //                         );
                  //                       } else {
                  //                         return const Text('error');
                  //                       }
                  //                     }
                  //                     return Text('Error');
                  //                   },
                  //                 ),

                  StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('History')
                    .where("userid", isEqualTo: auth.currentUser?.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(child: const CircularProgressIndicator());
                  }
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final datass = snapshot.data!.docs[index];
                          final document =
                              datass.data() as Map<String, dynamic>;
                          return SelectWorkmodel(details: document);
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
// ignore_for_file: file_names

class SelectWorkmodel extends StatelessWidget {
  SelectWorkmodel({super.key, required this.details});
  final Map<String, dynamic> details;

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    var _mediaQury = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey, //New
              blurRadius: 15.0,
            )
          ],
        ),
        width: _mediaQury.size.width * .10,
        height: _mediaQury.size.height * .15,
        // color: Colors.amber,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Wrap(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 80,
                        height: 90,
                        // color: Colors.amber,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20), // Image border
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(48), // Image radius
                            child: Image.network(details['userimagurl'],
                                fit: BoxFit.cover),
                          ),
                        )
                        // CircleAvatar(  child: ClipOval(child: Image.network(details['userimagurl'] ,)),
                        //   radius: 90,
                        // ),
                        ),
                  ),
                  Width10,
                  SizedBox(
                    // color: Colors.amber,
                    width: 260,
                    height: _mediaQury.size.height * .2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        hight20,
                        Text(
                          'Name :  ${details['username']}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        hight10,
                        Text(
                          'Location :  ${details['address']}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        hight10,
                        Text(
                          'Time :   ${details['date']}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        // hight10,
                      ],
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   width: double.infinity,
              //   // color: Colors.black,
              //   height: _mediaQury.size.height * .05,
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         SizedBox(
              //           width: _mediaQury.size.width * 0.4,
              //           child: ElevatedButton(
              //               style: ElevatedButton.styleFrom(
              //                 backgroundColor: Colors.green,
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius:
              //                       BorderRadius.circular(50), // <-- Radius
              //                 ),
              //               ),
              //               onPressed: () {},
              //               child: const Icon(Icons.message_sharp)),
              //         ),
              //       ]),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
