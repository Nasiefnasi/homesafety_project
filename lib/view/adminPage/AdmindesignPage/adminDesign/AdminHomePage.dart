// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
// import 'package:homesefty/Core/Colors%20,%20Width%20,%20Hight/colors&size.dart';
import 'package:homesefty/core/size/colors&size.dart';
// import 'package:homesefty/view/adminPage/AdmindesignPage/adminDesign/chart.dart';
import 'package:lottie/lottie.dart';

class AdminHomePage extends StatelessWidget {
  
  
  AdminHomePage({super.key});

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
              Container(
                color: Colors.amber,
                width: 90,
                height: 60,
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 30,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.amber,
                ),
              ),
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
                            height: 100,
                            width: double.infinity,
                            color: Colors.white,
                            child: Lottie.asset(
                                'asset/animation/animation_lk3s1v1o.json'),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Expanded(
                              child: Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
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
                            'asset/animation/animation_lk3s1v1o.json'),
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
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    AdminHomePageScrollModel(),
                    AdminHomePageScrollModel(),
                    AdminHomePageScrollModel(),
                    AdminHomePageScrollModel(),
                    AdminHomePageScrollModel(),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: const Color.fromARGB(37, 245, 245, 245),
                width: double.infinity,
                child: const Column(
                  children: [
                    
                  ],
                ),
              ),
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
  const AdminHomePageScrollModel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.amber),
        width: 130,
        height: double.infinity,
        child: const Center(child: Text("data")),
      ),
    );
  }
}
