// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:homesefty/VIEW/Employees/mainEmployeeDesignPage/ratingPage.dart';
import 'package:homesefty/controller/user/getxController/authcontroler/authcontroler.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/newWorkPage.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/notcompletedlist.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/walletPage.dart';
import 'package:homesefty/view/Employees/profilePage/profilepagedetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _page = [];
  @override
  void initState() {
    super.initState();
    _page = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Home Page',
            baseStyle: const TextStyle(
                color: Color.fromARGB(217, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            selectedStyle: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          const EmployesHome()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'New Work',
            baseStyle: const TextStyle(
                color: Color.fromARGB(217, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            selectedStyle: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          const NewWorkPage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Rating',
            baseStyle: const TextStyle(
                color: Color.fromARGB(217, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            selectedStyle: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          const RatingPag()
          // RatingPag()
          ),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Not completed',
            baseStyle: const TextStyle(
                color: Color.fromARGB(217, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            selectedStyle: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          const NotCompletedlist()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Wallet',
            baseStyle: const TextStyle(
                color: Color.fromARGB(217, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            selectedStyle: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          const WalletPage()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NewDrawer(),
      body: HiddenDrawerMenu(
          withShadow: true,
        
          slidePercent: 60,
          backgroundColorAppBar: const Color.fromARGB(255, 9, 88, 97),
          initPositionSelected: 0,
          screens: _page,
          backgroundColorMenu: const Color.fromARGB(255, 8, 99, 109)),
    );
  }

  void ScaffoldPrelayoutGeometry() {
    final control = Get.put(Authcontroller());
    Drawer(
      backgroundColor: const Color.fromARGB(255, 3, 55, 64),
      child: Column(children: [
        hight10,
        hight30,
        hight30,
        // Container(
        //   decoration: BoxDecoration(
        //       border: Border.all(
        //         width: 6,
        //         color: Colors.white,
        //       ),
        //       color: const Color.fromARGB(255, 5, 112, 92),
        //       borderRadius: BorderRadius.circular(20)),
        //   width: 160,
        //   height: 160,
        // ),
        hight20,
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return EmployeesProfilePage();
              },
            ));
          },
          leading: const Icon(
            Icons.person,
            size: 35,
            color: Colors.white,
          ),
          title: const Text(
            'Personal Details',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.room_preferences_outlined,
            size: 35,
            color: Colors.white,
          ),
          title: Text(
            'Terms and Conditions',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.info,
            size: 35,
            color: Colors.white,
          ),
          title: Text(
            'About',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          onTap: () async {
            control.signout(context);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove("emailKey");
            prefs.remove("passwordKey");
          },
          leading: Icon(
            Icons.logout,
            size: 35,
            color: Colors.white,
          ),
          title: Text(
            'Log Out',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
