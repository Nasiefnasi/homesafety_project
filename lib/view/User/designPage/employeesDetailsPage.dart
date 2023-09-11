// import 'dart:js';

// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/user/allwork/selectwork.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:provider/provider.dart';

class EmployeesDetailsPage extends StatelessWidget {
EmployeesDetailsPage({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    var _mediaqury = MediaQuery.of(context);
    return Consumer<SelectWorkPage>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Employees info'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  hight10,
                  Center(
                    child: SizedBox(
                      height: _mediaqury.size.height * .20,
                      width: _mediaqury.size.height * .2,
                      // color: Colors.amber,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(
                          data["imageUrl"],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Center(
                  //     child: ElevatedButton(
                  //         onPressed: () {}, child: Text('Add image'))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Name : ${data["fullname"]}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Phone : ${data["phonenumber"]}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sex : ${data["sex"]}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Age :  ${data["age"]}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Center(
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        width: _mediaqury.size.width * .9,
                        height: _mediaqury.size.height * .3,
                        // color: Colors.amber,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            //set border radius more than 50% of height and width to make circle
                          ),
                          color: const Color.fromARGB(131, 185, 212, 247),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Profession :- \n ${data['']}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  hight10,
                  Center(
                      child: SizedBox(
                    width: _mediaqury.size.width * .5,
                    // height: _mediaqury.size.height * .1,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 3, 67, 120))),
                        onPressed: () async {
                          final DocumentSnapshot snapshot =
                              await FirebaseFirestore.instance
                                  .collection('userdetails')
                                  .doc(auth.currentUser!.uid)
                                  .get();
                          if (snapshot.exists) {
                            // ignore: unused_local_variable
                            final Map<String, dynamic> data =
                                snapshot.data() as Map<String, dynamic>;
                            value.userdetails(
                                data['fullname'], data['imageUrl'], data['id']);
                            print('Full Name: ${data['fullname']}');
                            print(
                                'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
                          } else {
                            print("document snapshot is error");
                          }

                          // final datsa = (FirebaseFirestore.instance
                          //   ..collection('userdetails')
                          //       .doc(auth.currentUser?.uid).get()
                          //      );
                          // final document = datsa as Map<String, dynamic>;
                          // print(
                          //   document['fullname'],
                          // );

                          // value. userdetails(, work, workurl)
                          await value.employdetails(
                              data['id'],
                              data['fullname'],
                              data['address'],
                              data['imageUrl'].toString());

                          await value.addData(value.onclick);
                          Navigator.of(context).pop();
                          Get.snackbar("Message Success", "message");
                        },
                        child: const Text(
                          'Conform',
                          style: TextStyle(fontSize: 25),
                        )),
                  ))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
