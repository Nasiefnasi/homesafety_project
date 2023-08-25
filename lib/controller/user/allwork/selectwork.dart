// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/controller/user/allwork/workssSideModel.dart';

class SelectWorkPage extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String date = 'SELECT THE DATE';
  String? districtlss;
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  String employeesid='';
  String? district;
  String onclick = '';


  employId(String data){
    employeesid = data;

  }

  addData(String value) {
    onclick = value;
    if (value == 'Electronics') {
      UserSelectWork worksselect = UserSelectWork(
          employid: employeesid,
          phone: phone.text,
          workaddress: address.text,
          workdate: date,
          workdistrict: district);
      db
          .collection('SelectWork')
          .doc(auth.currentUser?.uid)
          .collection('Electronics')
          .add(worksselect.tomap());
    } else if (value == 'Plumber') {
      UserSelectWork worksselect = UserSelectWork(
          employid: employeesid,
          phone: phone.text,
          workaddress: address.text,
          workdate: date,
          workdistrict: district);
      db
          .collection('SelectWork')
          .doc(auth.currentUser?.uid)
          .collection('plumber')
          .add(worksselect.tomap());
    } else if (value == 'painter') {
      UserSelectWork worksselect = UserSelectWork(
          employid: employeesid,
          phone: phone.text,
          workaddress: address.text,
          workdate: date,
          workdistrict: district);
      db
          .collection('SelectWork')
          .doc(auth.currentUser?.uid)
          .collection('painter')
          .add(worksselect.tomap());
    } else if (value == 'driver') {
      UserSelectWork worksselect = UserSelectWork(
          employid: employeesid,
          phone: phone.text,
          workaddress: address.text,
          workdate: date,
          workdistrict: district);
      db
          .collection('SelectWork')
          .doc(auth.currentUser?.uid)
          .collection('dirver')
          .add(worksselect.tomap());
    } else if (value == 'gardeneer') {
      UserSelectWork worksselect = UserSelectWork(
          employid: employeesid,
          phone: phone.text,
          workaddress: address.text,
          workdate: date,
          workdistrict: district);
      db
          .collection('SelectWork')
          .doc(auth.currentUser?.uid)
          .collection('gardeneer')
          .add(worksselect.tomap());
    } else if (value == 'cook') {
      UserSelectWork worksselect = UserSelectWork(
          employid: employeesid,
          phone: phone.text,
          workaddress: address.text,
          workdate: date,
          workdistrict: district);
      db
          .collection('SelectWork')
          .doc(auth.currentUser?.uid)
          .collection('cook')
          .add(worksselect.tomap());
    }
  }

  void addDate(String value) {
    date = value;
    notifyListeners();
  }

  void selectdistrict(String data) {
    district = data;

    notifyListeners();
  }
  // Future<void> selectDate(BuildContext context) async {
  //   DateTime selectedDate = DateTime.now();
  //   DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );

  //   if (picked != null && picked != selectedDate) {
  //     selectedDate = picked;
  //     String formattedDate = DateFormat.yMd().format(selectedDate);
  //     dateTimeSelection(formattedDate);
  //   }

  //   notifyListeners();
  // }
}
