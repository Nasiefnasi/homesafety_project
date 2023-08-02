import 'package:flutter/material.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/newWorkPage.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/notcompletedlist.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/ratingPage.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/walletPage.dart';

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
          const RatingPag()),
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

  // ScreenHiddenDrawer notcompleted() {
  //   return ScreenHiddenDrawer(
  //       ItemHiddenMenu(
  //         name: 'Not completed',
  //         baseStyle: const TextStyle(
  //             color: Color.fromARGB(217, 255, 255, 255),
  //             fontWeight: FontWeight.bold,
  //             fontSize: 20),
  //         selectedStyle: const TextStyle(color: Colors.white, fontSize: 30),
  //       ),
  //       const NotCompletedlist());
  // }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        slidePercent: 60,
        backgroundColorAppBar: const Color.fromARGB(255, 9, 88, 97),
        initPositionSelected: 0,
        screens: _page,
        backgroundColorMenu: const Color.fromARGB(255, 8, 99, 109));
  }
}
