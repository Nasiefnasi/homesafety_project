import 'package:cloud_firestore/cloud_firestore.dart';

class UserSelectWork {
  String? workdate;
  String? workaddress;
  String? phone;
  String? workdistrict;
  String? employid;
  String? username;
  String? work;
  String? userimagurl;
  String? userid;
  String? employName;
  String? employeAddress;
  String? employurl;

  UserSelectWork({
    this.workdate,
    this.workaddress,
    this.phone,
    this.workdistrict,
    this.employid,
    this.username,
    required this.work,
    this.userimagurl,
    this.userid,
    this.employName,
    this.employeAddress,
    this.employurl,
  });
  factory UserSelectWork.formMap(DocumentSnapshot map) {
    return UserSelectWork(
        phone: map["phone"],
        workaddress: map['address'],
        workdate: map['date'],
        workdistrict: map['district'],
        employid: map["employid"],
        username: map["username"],
        work: map["work"],
        userimagurl: map["userimagurl"],
        userid: map['userid'],
        employName: map["employName"],
        employeAddress: map['employeAddress'],
        employurl: map['employurl']);
  }
  Map<String, dynamic> tomap() {
    return {
      "phone": phone,
      "address": workaddress,
      "date": workdate,
      "district": workdistrict,
      "employid": employid,
      "username": username,
      "work": work,
      "userimagurl": userimagurl,
      'userid': userid,
      'employName': employName,
      'employeAddress': employeAddress,
      'employurl': employurl
    };
  }
}
