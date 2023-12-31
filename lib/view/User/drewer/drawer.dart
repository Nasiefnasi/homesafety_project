// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/VIEW/User/userpersonaletailspage/userprofileUpdatepage.dart';
// import 'package:homesefty/VIEW/User/designPage/homePage/selectWork.dart';
import 'package:homesefty/controller/user/getxController/authcontroler/authcontroler.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
// import 'package:homesefty/view/User/designPage/homePage/selectWork.dart';
import 'package:homesefty/view/User/userpersonaletailspage/userpersonaldetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserNewDrawer extends StatelessWidget {
  UserNewDrawer({
    super.key,
    this.colorss,
  });
  final colorss;
  final control = Get.put(Authcontroller());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 166, 126, 4),
      child: Column(children: [
        hight10,
        hight30,
        hight30,
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('userdetails')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return const Text("Error");
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 6,
                        color: Colors.white,
                      ),
                      color: Color.fromARGB(255, 246, 137, 3),
                      borderRadius: BorderRadius.circular(20)),
                  width: 160,
                  height: 160,
                  child:  Center(child: Text("No Image")),
                  
                );
              }
              return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 6,
                        color: Colors.white,
                      ),
                      color: const Color.fromARGB(255, 5, 112, 92),
                      borderRadius: BorderRadius.circular(20)),
                  width: 160,
                  height: 160,
                  child: ClipRRect(
                      // Wrap Card with ClipRRect
                      borderRadius: BorderRadius.circular(
                          10.0), // Same as Card's borderRadius
                      child: Image.network(
                        snapshot.data!.docs.first['imageUrl'],
                        fit: BoxFit.cover,
                      )));
            }),
        hight20,
        ListTile(
          onTap: () {
             Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return  const  PersonalDetailsPage();
              },
            ));
           
          //  final datas= FirebaseFirestore.instance.collection('userdetails');
          // datas==null?  Get.to(const PersonalDetailsPage()):Get.to( UpdateUsersProfilePage());
          },
          leading: const Icon(
            Icons.person,
            size: 25,
            color: Colors.white,
          ),
          title: const Visibility(
            visible: true,
            child: Text(
              'Personal Details',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return  const UserNotCompletedListModel();
              },
            ));
          },
          leading: const Icon(
            Icons.webhook_rounded,
            size: 25,
            color: Colors.white,
          ),
          title: const Text(
            'Not Completed',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.room_preferences_outlined,
            size: 25,
            color: Colors.white,
          ),
          title: Text(
            'Terms and Conditions',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.info,
            size: 25,
            color: Colors.white,
          ),
          title: Text(
            'About',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Get.bottomSheet(
                Card(
                  child: ClipRRect(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(5)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 220, 243, 144),
                            Color.fromARGB(255, 239, 192, 2)
                          ],
                        ),
                      ),
                      child: Wrap(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.light_mode_outlined),
                            title: const Text('Light Theme',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            onTap: () {
                              Get.changeTheme(ThemeData.light());
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.light_mode_rounded),
                            title: const Text(
                              'Dark Theme',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onTap: ()async {
                            Get.changeTheme(ThemeData.dark());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent);
          },
          leading: const Icon(
            Icons.sunny,
            size: 25,
            color: Colors.white,
          ),
          title: const Text(
            'Theme change',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          onTap: ()async {
            control.signout(context);

            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs. remove("emailKey");
             prefs.remove("passwordKey");
             control.loginemail.clear();
             control.loginpassword.clear();
          },
          leading: const Icon(
            Icons.logout,
            size: 25,
            color: Colors.white,
          ),
          title: const Text(
            'Log Out',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}

