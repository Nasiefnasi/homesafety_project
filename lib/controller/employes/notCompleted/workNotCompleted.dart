import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/controller/employes/notCompleted/workNotCompletedmodel.dart';

class WorkNotCompleted extends ChangeNotifier {
  TextEditingController comments = TextEditingController();
  // String? usernames;
  // String? employnames;
  // String? userIDs;
  // String? emailIDs;
  // String? userurls;
  // String? employUrls;
  String? uids;
  String? eids;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  addOnfirebase(
    String userid,
    String? usernames,
    String? employnames,
  
    String? userurls,
    String? employUrls,
  ) async {
    NotCompleted notcompleted = NotCompleted(
      comment: comments.text.toString(),
      emploid: auth.currentUser!.uid,
      employename: employnames,
      username: usernames,
      employenameurl: employUrls,
      usernameurl: userurls,
      userId: userid,
    );
    eids = "${auth.currentUser!.uid}$userid";
    db.collection("NotCompleted").doc(eids).set(notcompleted.toJson());
  }

  _showDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: comments,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Enter your Comment here',
                    hintText: 'Why Not completed ',
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('OPEN'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
  
}
