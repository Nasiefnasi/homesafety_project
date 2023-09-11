// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/user/getxController/authcontroler/authcontroler.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/view/User/designPage/homePage/selectWork.dart';
import 'package:homesefty/view/User/userpersonaletailspage/userpersonaldetails.dart';

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
                child: Image.network(
                  snapshot.data!.docs.first['imageUrl'],
                  fit: BoxFit.cover,
                ),
              );
            }),
        hight20,
        ListTile(
          onTap: () {
            Get.to(PersonalDetailsPage());
          },
          leading: const Icon(
            Icons.person,
            size: 25,
            color: Colors.white,
          ),
          title: const Text(
            'Personal Details',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        ListTile(onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SelectWork();
            },));
          
          
        },
          leading: Icon(
            Icons.webhook_rounded,
            size: 25,
            color: Colors.white,
          ),
          title: Text(
            'Select Work',
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
                Wrap(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.abc),
                      title: const Text('Light Theme',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {
                        Get.changeTheme(ThemeData.light());
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.abc),
                      title: const Text(
                        'Dark Theme',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Get.changeTheme(ThemeData.dark());
                      },
                    ),
                  ],
                ),
                backgroundColor: Colors.amber);
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
          onTap: () {
            control.signout(context);
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
