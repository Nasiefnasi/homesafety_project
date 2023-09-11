import 'package:cloud_firestore/cloud_firestore.dart';


class Workstatus  {
  bool? startLevel = false;
  // bool? endLevel = false;
  String? employid;
  String? notcompleted;
  String? userId;
  Workstatus(
      {this.startLevel, 
      // this.endLevel,
      this.employid,
      this.userId,
      this.notcompleted});

  factory Workstatus.formMap(DocumentSnapshot map) {
    return Workstatus(
        startLevel: map['startLevel'],
        // endLevel: map["endLevel"],
        employid: map["employid"],
        userId: map["userId"],
        notcompleted: map["notcompleted"]);
  }
  Map<String, dynamic> tomap() {
    return {
      'startLevel': startLevel,
      // 'endLevel': endLevel,
      'employid': employid,
      'userId': userId,
      'notcompleted': notcompleted,
    };
  }
}
