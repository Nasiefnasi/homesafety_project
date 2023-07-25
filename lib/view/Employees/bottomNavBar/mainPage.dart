// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:homesefty/view/Employees/bottomNavBar/bottomNavBarModel.dart';
import 'package:homesefty/provider/navBar.dart';
import 'package:provider/provider.dart';

class Mainpage extends StatelessWidget {
  Mainpage({super.key});
  List<Widget> pageList = const [
    // Home(),
    // Favorite(),
    // // All_songlist(),
    // All_songlist(),
    // history_listt(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBar>(
      builder: (context, value, child) {
        return Scaffold(
            body: pageList[value.pageIndex],
            backgroundColor: const Color.fromARGB(0, 250, 0, 0),
            bottomNavigationBar: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 65,
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 69, 2, 93),
                        Color.fromARGB(255, 4, 99, 21)
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Bottomnavigation(
                        ontap: () {
                          value.pageIndex = 0;
                        },
                        icon: value.pageIndex == 0
                            ? Icons.home
                            : Icons.home_outlined),
                    Bottomnavigation(
                        ontap: () {
                          value.pageIndex = 1;
                        },
                        icon: value.pageIndex == 1
                            ? Icons.favorite
                            : Icons.favorite_border),
                    Bottomnavigation(
                        ontap: () {
                          value.pageIndex = 2;
                        },
                        icon: value.pageIndex == 2
                            ? Icons.play_lesson_outlined
                            : Icons.play_lesson),
                    Bottomnavigation(
                        ontap: () {
                          value.pageIndex = 3;
                        },
                        icon: value.pageIndex == 3
                            ? Icons.history_outlined
                            : Icons.history_toggle_off_sharp),
                    // Bottomnavigation(
                    //     ontap: () {
                    //       value.pageIndex = 4;
                    //     },
                    //     icon: value.pageIndex == 4
                    //         ? Icons.person
                    //         : Icons.person_3_outlined),
                  ],
                ),
              ),
            )));
      },
    );
  }
}

// kk
