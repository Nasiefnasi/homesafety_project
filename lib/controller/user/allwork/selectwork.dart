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
  String? username;
  String? userwork;
  String? userimageurl;
  String employeesid = '';
  String? district;
  String onclick = '';
  String? day = '';
  String? userid = '';
  String? employnames = "";
  String? employeAddresss = "";
  String? employimageurl = "";

  userdetails(String name, String workurl, String userids) {
    userid = userids;
    username = name;
    // userwork = work;
    userimageurl = workurl;
    userwork = onclick;
    notifyListeners();
  }

  employdetails(
      String id, String name, String employAddress, String? employimageUrls) {
    employeesid = id;
    employnames = name;
    employimageurl = employimageUrls;
    employeAddresss = employAddress;
  }

  selecrwork(String value) {
    onclick = value;
  }

  addData(String value) {
    if (value == 'Electronics') {
      UserSelectWork worksselect = UserSelectWork(
          userid: userid,
          username: username,
          work: userwork,
          userimagurl: userimageurl,
          employid: employeesid,
          phone: phone.text,
          workaddress: address.text,
          workdate: date,
          workdistrict: district,
          employName: employnames,
          employeAddress: employeAddresss,
          employurl: employimageurl);
      db
          .collection('SelectWork')
          .doc("selct")
          .collection('Electronics')
          .doc(day)
          .set(worksselect.tomap());
    } else if (value == 'Plumber') {
      UserSelectWork worksselect = UserSelectWork(
          userid: userid,
          username: username,
          work: userwork,
          userimagurl: userimageurl,
          employid: employeesid,
          phone: phone.text,
          workaddress: address.text,
          workdate: date,
          workdistrict: district,
          employName: employnames,
          employeAddress: employeAddresss,
          employurl: employimageurl);
      db
          .collection('SelectWork')
          .doc("selct")
          .collection('plumber')
          .doc(day)
          .set(worksselect.tomap());
    } else if (value == 'painter') {
      UserSelectWork worksselect = UserSelectWork(
          userid: userid,
          username: username,
          work: userwork,
          userimagurl: userimageurl,
          employid: employeesid,
          phone: phone.text,
          workaddress: address.text,
          workdate: date,
          workdistrict: district,
          employName: employnames,
          employeAddress: employeAddresss,
          employurl: employimageurl);
      db
          .collection('SelectWork')
          .doc("selct")
          .collection('painter')
          .doc(day)
          .set(worksselect.tomap());
    } else if (value == 'driver') {
      UserSelectWork worksselect = UserSelectWork(
          userid: userid,
          username: username,
          work: userwork,
          userimagurl: userimageurl,
          employid: employeesid,
          phone: phone.text,
          workaddress: address.text,
          workdate: date,
          workdistrict: district,
          employName: employnames,
          employeAddress: employeAddresss,
          employurl: employimageurl);
      db
          .collection('SelectWork')
          .doc("selct")
          .collection('dirver')
          .doc(day)
          .set(worksselect.tomap());
    } else if (value == 'gardeneer') {
      UserSelectWork worksselect = UserSelectWork(
          userid: userid,
          username: username,
          work: userwork,
          userimagurl: userimageurl,
          employid: employeesid,
          phone: phone.text,
          workaddress: address.text,
          workdate: date,
          workdistrict: district,
          employName: employnames,
          employeAddress: employeAddresss,
          employurl: employimageurl);
      db
          .collection('SelectWork')
          .doc("selct")
          .collection('gardeneer')
          .doc(day)
          .set(worksselect.tomap());
    } else if (value == 'cook') {
      UserSelectWork worksselect = UserSelectWork(
          userid: userid,
          username: username,
          work: userwork,
          userimagurl: userimageurl,
          employid: employeesid,
          phone: phone.text,
          workaddress: address.text,
          workdate: date,
          workdistrict: district,
          employName: employnames,
          employeAddress: employeAddresss,
          employurl: employimageurl);
      db
          .collection('SelectWork')
          .doc("selct")
          .collection('cook')
          .doc(day)
          .set(worksselect.tomap());
    }
  }

  void addDate(String value, String selectday) {
    //
    date = value;
    day = selectday;

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
