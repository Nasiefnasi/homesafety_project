import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:homesefty/model/User/homepage/chat%20message/message.dart';

class Chating extends ChangeNotifier {
  String? time;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> sendMessage(String receiversId, String message) async {
    String currentUserId = auth.currentUser!.uid;
    String currentUserEmail = auth.currentUser!.email.toString();
    Timestamp timestamps = Timestamp.now();
    time = timestamps.toString();
    Messages newmessage = Messages(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiversId,
        timestamp: time,
        message: message);
        

    List<String> ids = [currentUserId, receiversId];
    ids.sort();
    String chatroomId = ids.join("_");

    await db
        .collection("chat_room")
        .doc(chatroomId)
        .collection("message")
        .add(newmessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userId, String otherUserid) {
    List<String> Ids = [userId, otherUserid];
    Ids.sort();
    String chatroomId = Ids.join("_");
    return db
        .collection("chat_room")
        .doc(chatroomId)
        .collection("message")
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
