import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/controller/employes/chat/chatmodel.dart';
// import 'package:homesefty/MODEL/User/homepage/chat%20message/message.dart';

class                                                                                                 UserChating extends ChangeNotifier {
  String? time;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  // String? resveruid;

  // getuserreceiverId(String id) {
  //   resveruid = id;
  //   ;
  // }

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
  //       resveruid = data['employid'];
  //       print(
  //           "${resveruid}....................................e..............................e........................e");

  //       return Text('User ID: $resveruid');
  //     },
  //   );
  // }

  Future<void> senduserMessage(String message, String resiverIDs) async {
    // ignore: unused_local_variable
    // String? resveridss;

    // final DocumentSnapshot snapshot =
    //     await FirebaseFirestore.instance.collection('conformwork').doc().get();
    // if (snapshot.exists) {
    //   // ignore: unused_local_variable
    //   final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    //   resveridss = data['employid'];
    //   // value.userdetails(
    //   //     data['fullname'], data['imageUrl'], data['id']);
    //   // print('Full Name: ${data['fullname']}');
    //   print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
    // } else {
    //   print("document snapshot is error");
    // }

    String currentUserId = auth.currentUser!.uid;
    String currentUserEmail = auth.currentUser!.email.toString();
    Timestamp timestamps = Timestamp.now();
    time = timestamps.toString();
    Messages newmessage = Messages(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId:resiverIDs,
        timestamp: time,
        message: message);

    List<String> ids = [currentUserId, resiverIDs.toString()];

    ids.sort();
    // ignore: unused_local_variable
    String chatroomIds = ids.join("_");
    String uid = "$resiverIDs$currentUserId";
    await db
        .collection("chat_room")
        .doc(uid)
        .collection("message")
        .add(newmessage.toMap());
  }

  Stream<QuerySnapshot> getuserMessagess(String userId, String otherUserid) {
    String uid = "$otherUserid${auth.currentUser!.uid}";
    // List<String> ids = [userId, otherUserid];
    // ids.sort();
    // String uid = "$otherUserid$userId";
    // String chatroomIds = ids.join("_");
    return db
        .collection("chat_room")
        .doc(uid)
        .collection("message")
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
