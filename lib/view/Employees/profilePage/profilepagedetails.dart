// ignore_for_file: must_be_immutable, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:homesefty/controller/employes/getxemployessprofile/heroemployes.dart';
import 'package:homesefty/controller/getxemployessprofile/heroemployes.dart';
// import 'package:homesefty/controller/getxemployessprofile/heroemployes.dart';
import 'package:homesefty/view/Employees/profilePage/employeProfileUpdatePage.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class EmployeesProfilePage extends StatelessWidget {
  EmployeesProfilePage({super.key});

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    var mediaqury = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: const Text('Personal Details'),
      // ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: Provider.of<EmployesDetailsControl>(context)
              .getEmployeesDetailsStream(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return const Text('Error');
            }
            return ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Map<String, dynamic> personalDetails = {
                            'name': snapshot.data!.docs.first['fullname']
                                .toString(),
                            'address':
                                snapshot.data!.docs.first['address'].toString(),
                            'phone': snapshot.data!.docs.first['phonenumber']
                                .toString(),
                            'age': snapshot.data!.docs.first['age'].toString(),
                            'sex': snapshot.data!.docs.first['sex'].toString(),
                            'work':
                                snapshot.data!.docs.first['works'].toString(),
                            'experience': snapshot
                                .data!.docs.first['experience']
                                .toString(),
                            'district': snapshot.data!.docs.first['district']
                                .toString(),
                            'state':
                                snapshot.data!.docs.first['state'].toString(),
                          };
                          Get.to(EmployeProdilrUpdatePage(
                              details: personalDetails));
                        },
                        icon: const Icon(
                          Icons.edit_outlined,
                          size: 25,
                        ))
                  ],
                ),
                Center(
                  child: Container(
                    clipBehavior: Clip.none,
                    width: mediaqury.width * 0.4,
                    height: mediaqury.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 5,
                            color: const Color.fromARGB(255, 71, 33, 33))),
                    child: Image.network(
                      '${snapshot.data!.docs.first['imageUrl']}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ShowDetailWidget(
                  text: '${snapshot.data!.docs.first['fullname'].toString()}',
                ),
                ShowDetailWidget(
                  cusmeheight: 150,
                  text: '${snapshot.data!.docs.first['address'].toString()}',
                ),
                ShowDetailWidget(
                  text:
                      '${snapshot.data!.docs.first['phonenumber'].toString()}',
                ),
                ShowDetailWidget(
                  text: '${snapshot.data!.docs.first['age'].toString()}',
                ),
                ShowDetailWidget(
                  text: '${snapshot.data!.docs.first['sex'].toString()}',
                ),
                ShowDetailWidget(
                  text: '${snapshot.data!.docs.first['works'] }',
                  cusmeheight: 150,
                ),
                ShowDetailWidget(
                  text: '${snapshot.data!.docs.first['experience'].toString()}',
                ),
                ShowDetailWidget(
                  text: '${snapshot.data!.docs.first['district'].toString()}',
                ),
                ShowDetailWidget(
                  text: '${snapshot.data!.docs.first['state'].toString()}',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
// }

class ShowDetailWidget extends StatelessWidget {
  const ShowDetailWidget({
    super.key,
    required this.text,
    this.cusmeheight,
  });
  // ignore: prefer_typing_uninitialized_variables 
  final String text;
  final double? cusmeheight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      // ignore: sized_box_for_whitespace
      child: Container(
        width: double.infinity,
        height: cusmeheight ?? 60,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 5,
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 15),
                ))),
      ),
    );
  }
}
