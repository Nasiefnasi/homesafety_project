import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/employes/workStatus/workstatus.dart';

class EmployStatusLevel extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  // String? emploIds;
  // String? userIds;
  double turne = 3 / 4;
  String? userIds;
  String? emploIds;
  Map<String, dynamic> getdetails = {};
  Map<String, dynamic> detailssss = {};

  // onchange(double da, ) {
  //   turne = da;

  //   notifyListeners();
  // }

  bool start = false;
  bool end = false;
  // bool value = false;
  bool onstartChanged = false;
  bool onendChanged = false;
  startchagengdata() {
    if (onstartChanged == true) {
      onstartChanged = false;
      Get.snackbar("Work Not starting ", "");
    } else {
      onstartChanged = true;
      Get.snackbar("Work starting ", "");
    }
    notifyListeners();
  }

  endchagengdata() {
    if (onendChanged == true) {
      onendChanged = false;
      Get.snackbar("Work Not Completed ", "");
    } else {
      onendChanged =  true;
      Get.snackbar("Work Completed ", "Enter Your Payment");
    }
    notifyListeners();
  }

  addData(String userIds, String emailID) async {
    userIds = userIds;
    emploIds = emailID;

    start = onstartChanged;
    end = onendChanged;
    Workstatus status = Workstatus(
        startLevel: start.toString(),
        endLevel: onendChanged.toString(),
        userId: auth.currentUser!.uid,
        employid: userIds);
    String id = "${auth.currentUser!.uid}$userIds";
    await db.collection("WorkstatusLevel").doc(id).set(status.tomap());
  }








 
  Future<void> getfetchData(String emploiD) async {
    String idu = "${emploiD}${auth.currentUser!.uid}";
    try {
      // Reference the Firestore collection and document
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("WorkstatusLevel")
          .doc(idu)
          .get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Access the data from the document
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        getdetails = data;
        if (data['endLevel'] == "true") {
          turne = 1 / 4;
         
          notifyListeners();
        } else if (data['startLevel'] == "false") {
          turne = 3 / 4;
          notifyListeners();
        } else if (data['startLevel'] == 'true') {
           turne = 0.0;
          notifyListeners();
        }

        // Use the data as needed
        print("Data retrieved: $data");
      } else {
        print("Document does not exist.");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  Future<dynamic> getUserData(String usersIds) async {
    // String idu = "${emploiD}${auth.currentUser!.uid}";
    String id = "$usersIds";
    try {
      // Reference the Firestore collection and document
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("WorkstatusLevel")
          .doc(id)
          .get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Access the data from the document
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        detailssss = data ['startLevel'];
notifyListeners();
        
        // if (data['startLevel'] == 'true') {
        //   turne = 0.0;
        //   notifyListeners();
        // } else if (data['startLevel'] == "false") {
        //   turne = 3 / 4;
          // notifyListeners();
        // } else if (data['endLevel'] == "true") {
        //   turne = 1 / 4;
        //   notifyListeners();
        // }

        // Use the data as needed
        // print("Data retrieved: $data");
      } else {
        print("Document does not exist.");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }


 










}
// bool isClicked = false;
// void vv(){
//     Align(
//         alignment : Alignment.bottomCenter,
//         child: TextButton(
//             onPressed: () {
//                 setState(() => isClicked = !isClicked); // change click state
//                 if (isClicked) {
//                     // do something on click
//                 } else {
//                     // do something off click
//                 }
//             },
//         child: Text(isClicked ? "Stop" : "Save Data"), // if isClicked display "Stop" else display "Save Data"
//       ),
//     ),
// }

