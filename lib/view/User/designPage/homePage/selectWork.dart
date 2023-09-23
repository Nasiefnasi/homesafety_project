// ignore_for_file: unused_local_variable, avoid_unnecessary_containers, unused_import, sort_child_properties_last, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/VIEW/Employees/modelPage/boxdesign.dart';
import 'package:homesefty/VIEW/User/designPage/navBar/navbar.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:lottie/lottie.dart';

class UserSideHistory extends StatelessWidget {
  const UserSideHistory({super.key});

  @override
  Widget build(BuildContext context) {
    
    var mediaquery = MediaQuery.of(context).size;
    final double itemHeight = (mediaquery.height - kToolbarHeight - 24) / 2;
    final double itemWidth = mediaquery.width / 2;
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
        body: SafeArea(
            child: StreamBuilder(stream: FirebaseFirestore.instance.collection("History").where("userid",isEqualTo: auth.currentUser!.uid).snapshots(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Text("Error");
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
                          return   GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 5   ,
          crossAxisSpacing: 5,
          childAspectRatio: (itemWidth / itemHeight),
          controller: new ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          children: List.generate(
            snapshot.data!.docs.length,
            (index) {
              final data =snapshot.data!.docs[index];
              final document= data.data();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child:  HistoryModel(data: document),
              );
            },
          ));
      },
     
    )));
  }
}

class HistoryModel extends StatelessWidget {
  const HistoryModel({super.key, required this.data});
  final Map<String,dynamic>data;

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Boxdesign(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 57, 56, 56),
                    image:DecorationImage(image: NetworkImage( data['employimageurl']),fit: BoxFit.cover)
                    
                  ),
                  // child: ClipRect(  child: Image.network( data['userimageurl'],fit:BoxFit.cover,)),
                  width: mediaquery.width * .5,
                  height: mediaquery.height * .2),
              const Spacer(),
             Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                 data['employename'],
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black),
                ),
              ),
              const Spacer(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  data['workdate'],
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              hight10, const Spacer(),
              //  const Padding(
              //    padding: EdgeInsets.symmetric(horizontal: 10),
              //    child: Text("₹",maxLines: 2,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,),),
              //  ),
              // ignore: sized_box_for_whitespace
              Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child:  Text(
                     data['employephonenumber'],
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.green[900])),
                  ))
            ],
          ),
        ),
      ),
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
                  child: SizedBox(
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
