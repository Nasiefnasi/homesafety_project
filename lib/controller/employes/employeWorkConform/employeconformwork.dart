// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/controller/employes/employeWorkConform/workconformmodel.dart';

class conformworkdatasave extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String? userids;
  String? username;
  String? userimagurl;
  String? useraddress;
  String? employeimageurl;
  String? employename;
  String? empolysid;
  String? employephonenumber;
  String? workdatas;
  userdetails(
    String? date,
    String? userimag,
    String? usernames,
    String? useradd,
    String? employeesid,
    String? userid,
  ) {
    workdatas = date;
    userimagurl = userimag;
    useraddress = useradd;
    empolysid = employeesid;
    username = usernames;
    userids = userid;
  }

  employdetails(
    String? employname,
    String? employimageurl,
    String? employephone,
  ) {
    employename = employname;
    employeimageurl = employimageurl;
    employephonenumber = employephone;
  }

  conformworkAdddetails() {
    Conformworkmodel conformwork = Conformworkmodel(
        workdate: workdatas,
        useraddress: useraddress,
        employid: empolysid,
        employename: employename,
        employephonenumber: employephonenumber,
        employimageurl: employeimageurl,
        userid: userids,
        userimageurl: userimagurl,
        username: username);
    db.collection('conformwork').add(conformwork.tomap());
    db.collection('History').add(conformwork.tomap());
    
  }
}
