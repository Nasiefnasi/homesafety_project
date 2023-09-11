import 'package:cloud_firestore/cloud_firestore.dart';

class Messages {
  String? senderId;
  String? senderEmail;
  String? receiverId;
  String? message;
  String? timestamp;
  Messages(
      {this.senderId,
      this.senderEmail,
      this.receiverId,
      this.message,
      this.timestamp});

  factory Messages.formMap(DocumentSnapshot map) {
    return Messages();
  }

  Map<String, dynamic> toMap() {
    return {
      "senderId": senderId,
      "senderEmail": senderEmail,
      "receiverId": receiverId,
      "message": message,
      "timestamp": timestamp,
    };
  }
}
