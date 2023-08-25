import 'package:cloud_firestore/cloud_firestore.dart';

class UserSelectWork {
  String? workdate;
  String? workaddress;
  String? phone;
  String? workdistrict;
  String? employid;

  UserSelectWork(
      {this.workdate,
      this.workaddress,
      this.phone,
      this.workdistrict,
      this.employid});
  factory UserSelectWork.formMap(DocumentSnapshot map) {
    return UserSelectWork(
      phone: map["phone"],
      workaddress: map['address'],
      workdate: map['date'],
      workdistrict: map['district'],
      employid: map["employid"],
    );
  }
  Map<String, dynamic> tomap() {
    return {
      "phone": phone,
      "address": workaddress,
      "date": workdate,
      "district": workdistrict,
      "employid": employid,
    };
  }
}
