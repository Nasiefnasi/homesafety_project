import 'package:cloud_firestore/cloud_firestore.dart';

class Conformworkmodel {
  String? userimageurl;
  String? username;
  String? useraddress;
  String? userid;
  String? employimageurl;
  String? employename;
  String? employid;
  String? employephonenumber;
  String? workdate;
  Conformworkmodel({
    this.employename,
    this.employephonenumber,
    this.employimageurl,
    this.employid,
    this.userimageurl,
    this.username,
    this.useraddress,
    this.userid,
    this.workdate,
  });
  factory Conformworkmodel.formMap(DocumentSnapshot map) {
    return Conformworkmodel(
      employename: map['employename'],
      employephonenumber: map['employephonenumber'],
      employid: map['employid'],
      employimageurl: map['employimageurl'],
      userimageurl: map['userimageurl'],
      username: map['username'],
      userid: map['userid'],
      useraddress: map['useraddress'],
      workdate: map['workdate'],
    );
  }
  Map<String, dynamic> tomap() {
    return {
      'employename': employename,
      'employephonenumber': employephonenumber,
      'employid': employid,
      'employimageurl': employimageurl,
      'userimageurl': userimageurl,
      'username': username,
      'userid': userid,
      'useraddress': useraddress,
      'workdate': workdate,
    };
  }
}
