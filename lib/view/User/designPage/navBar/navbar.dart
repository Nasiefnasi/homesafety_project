// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:homesefty/VIEW/User/designPage/homePage/selectWork.dart';
// import 'package:homesefty/VIEW/User/designPage/homePage/selectWork.dart';
// import 'package:get/get.dart';
import 'package:homesefty/view/Employees/bottomNavBar/bottomNavBarModel.dart';
// import 'package:homesefty/view/User/designPage/history.dart';

import 'package:homesefty/view/User/drewer/drawer.dart';
import 'package:homesefty/view/User/designPage/homePage/homepage.dart';
import 'package:homesefty/view/User/designPage/paymentRequest.dart';
import 'package:homesefty/provider/navBar.dart';
import 'package:provider/provider.dart';

class BottoNavBar extends StatelessWidget {
  BottoNavBar({super.key});
  List<Widget> pageList = [
    const UserHomePage(),
    const UserPaymentRequestPage(),
    const UserSideHistory()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBar>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "HOME SAFETY",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('asset/animation/LOGO-01.png'),
                )
              ]),
            drawer: UserNewDrawer(),
            body: pageList[value.pageIndex],
            // backgroundColor: Color.fromARGB(0, 76, 76, 76),
            bottomNavigationBar: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 65,
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 0, 14, 5),
                        Color.fromARGB(255, 9, 122, 14)
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topLeft,
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Bottomnavigation(
                          ontap: () {
                            value.pageIndex = 0;
                          },
                          icon: value.pageIndex == 0
                              ? Icons.supervised_user_circle_rounded
                              : Icons.home),
                      Bottomnavigation(
                          ontap: () {
                            value.pageIndex = 1;
                          },
                          icon: value.pageIndex == 1
                              ? Icons.currency_rupee_sharp
                              : Icons.payment_outlined),
                      Bottomnavigation(
                          ontap: () async {
                            value.pageIndex = 2;
                          },
                          icon: value.pageIndex == 2
                              ? Icons.history_edu
                              : Icons.history),

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
              ),
            )));
      },
    );
  }
}

// kk
