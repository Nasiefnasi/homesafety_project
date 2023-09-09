// ignore_for_file: must_be_immutable, file_names

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:homesefty/Core/Colors%20,%20Width%20,%20Hight/colors&size.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/provider/navBar.dart';
import 'package:homesefty/view/Employees/bottomNavBar/bottomNavBarModel.dart';
import 'package:homesefty/view/adminPage/AdmindesignPage/adminDesign/allemployes.dart';
import 'package:homesefty/view/adminPage/AdmindesignPage/adminDesign/wallet.dart';
import 'package:homesefty/view/adminPage/completedWork.dart';
// import 'package:homesefty/view/adminPage/AdmindesignPage/adminDesign/chart.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AdminHomePage extends StatelessWidget {
  AdminHomePage({super.key});
  Map<String, double> dataMap = {
    "all empolyes": 7,
    "all users": 4,
    "all work": 6
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          hight10,
          Row(
            children: [
              Center(
                child: Container(
                  // color: Colors.amber,
                  width: 110,
                  height: 50,
                  child: Image.asset('asset/animation/LOGO-2-01.png'),
                ),
              ),
              const Spacer(),
              // const CircleAvatar(
              //   radius: 30,
              //   child: CircleAvatar(
              //     radius: 25,
              //     backgroundColor: Colors.amber,
              //   ),
              // ),
            ],
          ),
          hight30,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 160,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 100,
                            color: Colors.white,
                            child: Lottie.asset(
                                'asset/animation/animation_llucantg.json',
                                fit: BoxFit.cover),
                          ),
                          hight10,
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Lottie.asset(
                            'asset/animation/animation_llucpusx (1).json'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          hight20,
          Container(
            height: 50,
            width: double.infinity,
            color: const Color.fromARGB(103, 158, 158, 158),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    AdminHomePageScrollModel(
                      text: 'Performance',
                      ontap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) {
                        //     return Employeslist();
                        //   },
                        // ));
                      },
                    ),
                    AdminHomePageScrollModel(
                      text: 'All Employees',
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Employeslist();
                          },
                        ));
                      },
                    ),
                    AdminHomePageScrollModel(
                      text: 'Completed work',
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return CompletedWork();
                          },
                        ));
                      },
                    ),
                    AdminHomePageScrollModel(
                      text: 'Wallet',
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return  Adminwallet();
                          },
                        ));
                      },
                    ),
                    // AdminHomePageScrollModel(),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                  color: Color.fromARGB(36, 227, 23, 23),
                  width: double.infinity,
                  child: Center(child: PieChartWidget())),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Wrap(
                children: [
                  const Text(
                    'Blue',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Width10,
                  Container(
                    width: 20,
                    height: 20,
                    color: Colors.amber,
                  )
                ],
              ),
              Wrap(
                children: [
                  const Text(
                    'Blue',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Width10,
                  Container(
                    width: 20,
                    height: 20,
                    color: Colors.deepPurpleAccent,
                  )
                ],
              ),
              Wrap(
                children: [
                  const Text(
                    'Blue',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Width10,
                  Container(
                    width: 20,
                    height: 20,
                    color: Colors.orangeAccent,
                  )
                ],
              ),
              Wrap(
                children: [
                  const Text(
                    'Blue',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Width10,
                  Container(
                    width: 20,
                    height: 20,
                    color: Colors.red,
                  )
                ],
              ),
            ],
          )
        ],
      )),
    );
  }

  List<double> data = [30, 80, 20, 50];
}

class AdminHomePageScrollModel extends StatelessWidget {
  final text;
  final void Function() ontap;
  const AdminHomePageScrollModel({
    super.key,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.amber),
          width: 130,
          height: double.infinity,
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}

class BottoNavBars extends StatelessWidget {
  BottoNavBars({super.key});
  List<Widget> pageList = [
    // const UserHomePage(),
    // const UserPaymentRequestPage(),
    // const UserHistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBar>(
      builder: (context, value, child) {
        return Scaffold(
            // drawer: UserNewDrawer(),
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
                          ontap: () {
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

class PieChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 30,
              color: Color.fromARGB(255, 39, 180, 4),
              title: 'All User',
            ),
            PieChartSectionData(
              value: 20,
              color: Color.fromARGB(255, 254, 234, 6),
              title: 'All Empolyes',
            ),
            PieChartSectionData(
              value: 90,
              color: Colors.white,
              title: '           completed work',
            ),

            // Add more sections as needed
          ],
        ),
      ),
    );
  }
}
