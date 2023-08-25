// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:homesefty/controller/user/setworkcontroller/detailsmodel.dart';

// class Workscontroller extends ChangeNotifier {
//   FirebaseFirestore db = FirebaseFirestore.instance;
//   FirebaseAuth auth = FirebaseAuth.instance;
//   TextEditingController number = TextEditingController();
//   TextEditingController address = TextEditingController();
//   String? date;

//   void addwork(String data) async {
//     if (data == "election") {
//       try {
//         WorkDetails work = WorkDetails(
//           address: address.text,
//           number: number.text,
//           date: date,
//         );
//         await db
//             .collection('Employes')
//             .doc(auth.currentUser?.uid)
//             .collection('conform works')
//             .doc('total works')
//             .collection('election')
//             .doc("work")
//             .set(work.ttomap());
//       } catch (e) {
//         // ignore: unnecessary_brace_in_string_interps
//         Get.snackbar('Error', '${e}');
//       }
//     } else if (data == "plumber") {
//       try {
//         WorkDetails work = WorkDetails(
//           address: address.text,
//           number: number.text,
//           date: date,
//         );
//         await db
//             .collection('Employes')
//             .doc(auth.currentUser?.uid)
//             .collection('conform works')
//             .doc('total works')
//             .collection('plumber')
//             .doc("work")
//             .set(work.ttomap());
//       } catch (e) {
//         // ignore: unnecessary_brace_in_string_interps
//         Get.snackbar('Error', '${e}');
//       }
//     } else if (data == 'driver') {
//       try {
//         WorkDetails work = WorkDetails(
//           address: address.text,
//           number: number.text,
//           date: date,
//         );
//         await db
//             .collection('Employes')
//             .doc(auth.currentUser?.uid)
//             .collection('conform works')
//             .doc('total works')
//             .collection('driver')
//             .doc("work")
//             .set(work.ttomap());
//       } catch (e) {
//         // ignore: unnecessary_brace_in_string_interps
//         Get.snackbar('Error', '${e}');
//       }
//     } else if (data == 'cook') {
//       try {
//         WorkDetails work = WorkDetails(
//           address: address.text,
//           number: number.text,
//           date: date,
//         );
//         await db
//             .collection('Employes')
//             .doc(auth.currentUser?.uid)
//             .collection('conform works')
//             .doc('total works')
//             .collection('cook')
//             .doc("work")
//             .set(work.ttomap());
//       } catch (e) {
//         // ignore: unnecessary_brace_in_string_interps
//         Get.snackbar('Error', '${e}');
//       }
//     }else if (data == 'cook') {
//       try {
//         WorkDetails work = WorkDetails(
//           address: address.text,
//           number: number.text,
//           date: date,
//         );
//         await db
//             .collection('Employes')
//             .doc(auth.currentUser?.uid)
//             .collection('conform works')
//             .doc('total works')
//             .collection('cook')
//             .doc("work")
//             .set(work.ttomap());
//       } catch (e) {
//         // ignore: unnecessary_brace_in_string_interps
//         Get.snackbar('Error', '${e}');
//       }
//     }
//   }
// }
