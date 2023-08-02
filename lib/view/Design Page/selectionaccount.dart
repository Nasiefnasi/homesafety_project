// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/employeprofiledetailspage.dart';
import 'package:homesefty/view/User/userpersonaletailspage/presonalDetalsInsertpage.dart';

class SelectAccount{
 
    void _showbottomsheett(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
      ),
      elevation: 50,
      backgroundColor: const Color.fromARGB(38, 22, 23, 23),
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.0),
                  topLeft: Radius.circular(50.0)),
              color: Color.fromARGB(255, 254, 254, 254)),
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(const EmployeProfilePage());
                      },
                      child: const Text('Employess'),
                      style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 8, 105, 134)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))))),
              SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(UserpersonalDetailesPage());
                      },
                      child: const Text('User'),
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.amber),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))))),
            ],
          ),
        );
      },
    );
  }
} 
