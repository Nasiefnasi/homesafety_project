import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/controller/employes/chat/chatmodel.dart';
import 'package:homesefty/model/User/homepage/chat%20message/message.dart';

class EmployeChating extends ChangeNotifier {
  String? time;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  String? resveridss;
  getreceiverId(String id) {
    resveridss = id;
    print("${resveridss}hhhhhHhHHHHhHHHhhhhhhhhhhhhhhhhhhhhhhhhkl;h");
    
  }

  // Stream<DocumentSnapshot> getUserDataAsStream() {
  //   return FirebaseFirestore.instance
  //       .collection('conformwork')
  //       .doc()
  //       .snapshots();
  // }

  // css() {
  //   StreamBuilder<DocumentSnapshot>(
  //     stream: getUserDataAsStream(),
  //     builder:
  //         (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return CircularProgressIndicator();
  //       }

  //       if (snapshot.hasError) {
  //         return Text('Error: ${snapshot.error}');
  //       }

  //       if (!snapshot.hasData || !snapshot.data!.exists) {
  //         return Text('Document does not exist');
  //       }

  //       final Map<String, dynamic> data =
  //           snapshot.data!.data() as Map<String, dynamic>;
  //       resveridss = data['userid'];
  //       print(
  //           "${resveridss}....................................e..............................e........................e");

  //       return Text('User ID: $resveridss');
  //     },
  //   );
  // }

  Future<void> sendemployiMessage(String message ,String resiverID) async {
    // ignore: unused_local_variable

    String currentUserId = auth.currentUser!.uid;
    String currentUserEmail = auth.currentUser!.email.toString();
    Timestamp timestamps = Timestamp.now();
    time = timestamps.toString();
    Messages newmessage = Messages(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: resiverID,
        timestamp: time,
        message: message);

    // List<String> ids = [resveridss.toString(), currentUserId];

    String uid = "$currentUserId$resiverID";

    print("${uid}...........................eeeeeeeeeee1");
    print(auth.currentUser!.uid);
    // ids.sort();
    // String chatroomIds = ids.join("_");

    await db
        .collection("chat_room")
        .doc(uid)
        .collection("message")
        .add(newmessage.toMap());
  }

  // Future<void>createChatRoom()async{

  //   Map<String,dynamic>data={};
  //   db.collection(uid).add()
  // }

  Stream<QuerySnapshot> getemployMessages(
   String userId, String otherUserid
    ) {
    // List<String> ids = [otherUserid,userId];
    // ids.sort();
    // String uid = "$userId$otherUserid";
    // String chatroomIds = ids.join("_");
    String uid = "${auth.currentUser!.uid}$otherUserid";
    print("${otherUserid}vbgbvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
    print("${uid}...........................eeeeeeeeeeeeeeeee");
    return db
        .collection("chat_room")
        .doc(uid)
        .collection("message")
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
