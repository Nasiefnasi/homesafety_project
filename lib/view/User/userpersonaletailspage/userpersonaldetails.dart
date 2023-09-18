// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/user/allwork/selectwork.dart';
import 'package:homesefty/controller/user/getxController/gextuserprofile/userdetailsstoredb.dart';
import 'package:homesefty/view/User/drewer/drawer.dart';
// import 'package:homesefty/view/User/designPage/homePage/homepage.dart';

import 'package:homesefty/view/User/userpersonaletailspage/userprofileUpdatepage.dart';
import 'package:provider/provider.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({super.key});

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // Provider.of<SelectWorkPage>(context).userdetails(, workurl);
    // ignore: unused_local_variable
    var control = Get.put(UserDetailscontroler());
    var mediaqury = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: UserNewDrawer(),
      appBar: AppBar(
        title: const Text('Personal Details'),
      ),
      body: Consumer<SelectWorkPage>(builder: (context, value, child) {
        return SafeArea(
            child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('userdetails').snapshots(),
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
                            'email':
                                snapshot.data!.docs.first['email'].toString(),
                            'district': snapshot.data!.docs.first['district']
                                .toString(),
                            'state':
                                snapshot.data!.docs.first['state'].toString(),
                          };
                          Get.to(
                            UpdateUserProfilePage(details: personalDetails),
                          );
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
                  text: snapshot.data!.docs.first['fullname'].toString(),
                ),
                ShowDetailWidget(
                  text: snapshot.data!.docs.first['address'].toString(),
                  cusmeheight: 130,
                ),
                ShowDetailWidget(
                  text: snapshot.data!.docs.first['phonenumber'].toString(),
                ),
                ShowDetailWidget(
                  text: snapshot.data!.docs.first['email'].toString(),
                ),
                ShowDetailWidget(
                  text: snapshot.data!.docs.first['district'].toString(),
                ),
                ShowDetailWidget(
                  text: snapshot.data!.docs.first['state'].toString(),
                ),
              ],
            );
          },
        ));
      }),
    );
  }
}
// }

Future<void> currentUserData() async {
  // final getuserdetails =await FirebaseFirestore.instance.collection('userdetails').;
}

class ShowDetailWidget extends StatelessWidget {
  const ShowDetailWidget({
    super.key,
    this.text,
    this.cusmeheight,
  });
  // ignore: prefer_typing_uninitialized_variables
  final text;
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
