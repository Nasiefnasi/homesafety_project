// ignore_for_file: avoid_print, use_build_context_synchronously, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/user/getxController/authcontroler/usermodel.dart';
import 'package:homesefty/view/Design%20Page/loginpage.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/hiddenDrawer.dart';
import 'package:homesefty/view/Employees/profilePage/employeprofiledetailspageinsert.dart';
// import 'package:homesefty/view/User/designPage/homePage/homepage.dart';
import 'package:homesefty/view/User/designPage/navBar/navbar.dart';
// import 'package:homesefty/view/User/designPage/navBar/navbar.dart';
import 'package:homesefty/view/User/userpersonaletailspage/presonalDetalsInsertpage.dart';
// import 'package:homesefty/view/adminPage/AdmindesignPage/adminDesign/AdminHomePage.dart';

class Authcontroller extends GetxController {
  // step 1 create instance
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController loginemail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();
  TextEditingController resetmail = TextEditingController();
  var loading = false.obs;

  String? user;

  // setp 2 create the funtion
  // create account with email and password
  usersignup(String value) async {
    try {
      loading.value = true;
      await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      Map<String, dynamic> userData = {'type': value};
      await FirebaseFirestore.instance
          .collection('all_users')
          .doc(auth.currentUser!.uid)
          .set(userData);

      await addUser(value);
      await verifyemail();
      // Get.to(() => SelectAccount());
      if (value == 'user') {
        Get.to(UserpersonalDetailesPage());
      } else {
        Get.to(const EmployeProfilePage());
      }

      loading.value = false;
    } catch (e) {
      Get.snackbar("error", "this isj error$e");
      print('i$e');
      loading.value = false;
    }
  }

  // add user to database
  addUser(String value) async {
    if (value == 'user') {
      UserModel user = UserModel(
        Username: username.text,
        email: auth.currentUser?.email,
      );
      await db
          .collection("User")
          .doc(auth.currentUser?.uid)
          .collection("profile")
          .add(user.toMap());
    } else {
      UserModel employ = UserModel(
        Username: username.text,
        email: auth.currentUser?.email,
      );
      await db
          .collection("Employes")
          .doc(auth.currentUser?.uid)
          .collection("profile")
          .add(employ.toMap());
    }
  }
  // add Employes to database
  // addemployes() async {
  //   UserModel user = UserModel(
  //     Username: username.text,
  //     email: auth.currentUser?.email,
  //   );
  //   await db
  //       .collection("Employes")
  //       .doc(auth.currentUser?.uid)
  //       .collection("profile")
  //       .add(user.toMap());
  // }

  signout(BuildContext context) async {
    await auth.signOut();
    Navigator.popUntil(context, (route) => false);
  }

  // if (value == 'user') {
  //       Get.to(BottoNavBar());
  //     } else {
  //       Get.to(HiddenDrawer());
  //     }

  signIn(BuildContext context) async {
    try {
      loading.value = true;
      await auth.signInWithEmailAndPassword(
          email: loginemail.text, password: loginpassword.text);

      DocumentSnapshot<Map<String, dynamic>> emplyData = await FirebaseFirestore
          .instance
          .collection('all_users')
          .doc(auth.currentUser!.uid)
          .get();
      final document = emplyData.data() as Map<String, dynamic>;
      if (document['type'] == 'employess') {
        // DocumentSnapshot<Map<String, dynamic>> userProfile =
        //     await FirebaseFirestore.instance
        //         .collection('User')
        //         .doc(auth.currentUser!.uid)
        //         .get();
        // final userdocument = userProfile.data() as Map<String, dynamic>;
        // user = userdocument['fullname'];
        await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HiddenDrawer()),
            (route) => false);
      } else {
        await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottoNavBar()),
            (route) => false);
      }
      // if(emplyData==null){
      //    await Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(builder: (context) => UserpersonalDetailesPage()),
      //       (route) => false);
      // }else{
      //    await Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(builder: (context) => UserHomePage()),
      //       (route) => false);
      // }
    
      // if(loginemail.text ==  emplyData ){

      // }else if (loginemail.text == ){

      // }

      // await Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => UserpersonalDetailesPage()),
      //     (route) => false);
      // Get.put( SelectAccount());
      loading.value = false;
      // _showbottomsheett(context);
    } catch (e) {
      Get.snackbar("error", "$e");
      loading.value = false;
    }
  }

  verifyemail() async {
    await auth.currentUser?.sendEmailVerification();
    Get.snackbar("Email", "Check your email", backgroundColor: Colors.white);
  }

//  user reset password
  resetpassword() async {
    try {
      loading.value = true;
      await auth.sendPasswordResetEmail(email: resetmail.text);
      Get.put(LoginPage());
      Get.snackbar("Send the link", 'Email');
      loading.value = false;
    } catch (e) {
      Get.snackbar("Error", "$e");
      loading.value = false;
    }
  }
//    void _showbottomsheett(BuildContext context) {
//     showModalBottomSheet(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
//       ),
//       elevation: 50,
//       backgroundColor: const Color.fromARGB(38, 22, 23, 23),
//       context: context,
//       builder: (context) {
//         return Container(
//           decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(50.0),
//                   topLeft: Radius.circular(50.0)),
//               color: Color.fromARGB(255, 254, 254, 254)),
//           height: 150,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               SizedBox(
//                   height: 50,
//                   width: 150,
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Get.to(EmployeProfilePage());
//                       },
//                       child: Text('Employess'),
//                       style: ButtonStyle(
//                           backgroundColor: MaterialStatePropertyAll(
//                               Color.fromARGB(255, 8, 105, 134)),
//                           shape:
//                               MaterialStateProperty.all<RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ))))),
//               SizedBox(
//                   height: 50,
//                   width: 150,
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Get.to(UserpersonalDetailesPage());
//                       },
//                       child: Text('User'),
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStatePropertyAll(Colors.amber),
//                           shape:
//                               MaterialStateProperty.all<RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ))))),
//             ],
//           ),
//         );
//       },
//     );
//   }

  StreamBuilder() async* {}
}
