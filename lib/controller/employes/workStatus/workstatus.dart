import 'package:cloud_firestore/cloud_firestore.dart';

class Workstatus {
  String?  startLevel;
  String? endLevel ;
  String? employid;

  String? userId;
  Workstatus({
    this.startLevel,
    this.endLevel,
    this.employid,
    this.userId,
  });

  factory Workstatus.formMap(DocumentSnapshot map) {
    return Workstatus(
      startLevel: map['startLevel'],
      endLevel: map["endLevel"],
      employid: map["employid"],
      userId: map["userId"],
    );
  }
  Map<String, dynamic> tomap() {
    return {
      'startLevel': startLevel,
      'endLevel': endLevel,
      'employid': employid,
      'userId': userId,
    };
  }
}
