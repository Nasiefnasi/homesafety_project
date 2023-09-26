// ignore_for_file: must_be_immutable, unnecessary_string_interpolations, unused_local_variable

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
    

    var mediaqury = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: const Text('Personal Details'),
      // ),
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
          stream:
           Provider.of<EmployesDetailsControl>(context)
              .getEmployeesDetailsStream(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (!snapshot.hasData) {
              return const Text('Error');
            }
            final data=snapshot.data!.data()as Map<String,dynamic>;
            final name=data['fullname'];
            return ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Map<String, dynamic> personalDetails = {
                            'name': data['fullname']
                                .toString(),
                            'address':
                                data['address'].toString(),
                            'phone': data['phonenumber']
                                .toString(),
                            'age': data['age'].toString(),
                            'sex': data['sex'].toString(),
                            'work':
                                data['works'].toString(),
                            'experience':data['experience']
                                .toString(),
                            'district': data['district']
                                .toString(),
                            'state':
                                data['state'].toString(),
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
                     data['imageUrl']  ?? "https://www.biiainsurance.com/wp-content/uploads/2015/05/no-image.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ShowDetailWidget(
                  text: data['fullname'].toString()
                ),
                ShowDetailWidget(
                  cusmeheight: 150,
                  text: data['address'].toString()
                ),
                ShowDetailWidget(
                  text:
                     data['phonenumber'].toString()
                ),
                ShowDetailWidget(
                  text: data['age'].toString()
                ),
                ShowDetailWidget(
                  text: data['sex'].toString()
                ),
                ShowDetailWidget(
                  text: data['works'].toString(),
                  cusmeheight: 150,
                ),
                ShowDetailWidget(
                  text: data['experience'].toString()
                ),
                ShowDetailWidget(
                  text: data['district'].toString()
                ),
                ShowDetailWidget(
                  text: data['state'].toString()
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
                child: Text(overflow: TextOverflow.ellipsis,maxLines: 5,
                  text,
                  style: const TextStyle(fontSize: 15),
                ))),
      ),
    );
  }
}
