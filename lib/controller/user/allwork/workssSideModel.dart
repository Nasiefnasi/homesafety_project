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
        userid: map['userid']);
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
      'userid': userid
    };
  }
}
