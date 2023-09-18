// ignore_for_file: unused_import

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/getxemployessprofile/employessmoder.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/hiddenDrawer.dart';
import 'package:image_picker/image_picker.dart';

class EmployesDetailsControl extends ChangeNotifier {
  //step 1 create instamce

  FirebaseFirestore edb = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  //
  //

  File? image;
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  String sex = '';
  TextEditingController ages = TextEditingController();
  TextEditingController address = TextEditingController();
  List<Map<dynamic, dynamic>> works = [];
  TextEditingController experience = TextEditingController();
  String? district = '';
  String employId = '';
  TextEditingController state = TextEditingController();
  var loading = false.obs;

  getSex(String data) {
    sex = data;
    notifyListeners();
  }

  getworklist(Map<dynamic, dynamic> datas) {
    works.clear();
    works.add(datas);
  }

  addemployea() async {
    // ignore: unused_local_variable
    try {
      loading.value = true;
      await imageuplode();
      EmployesDetailsModel employeobj = EmployesDetailsModel(
        id: auth.currentUser?.uid,
        work: works.first['name'],
        imageUrl: selectimagepath,
        fullname: name.text,
        phonenumber: phone.text,
        sex: sex,
        age: ages.text,
        address: address.text,
        experience: experience.text,
        district: district,
        state: state.text,
      );
      await edb
          // .collection('Employes')
          // .doc(auth.currentUser?.uid)
          // .collection('EmployesDetails')
          // .doc('name')
          // .set(employeobj.ttomap());
          .collection('Employes')
          .doc(auth.currentUser?.uid)
          .set(employeobj.ttomap());
      loading.value = false;
      Get.snackbar("Successful ", "Your Data");
      Get.to(const HiddenDrawer());
    } catch (e) {
      // ignore: unnecessary_brace_in_string_interps
      Get.snackbar("Error", '${e}');
    }
  }

  var imageshow = ''.obs;
  String selectimagepath = '';
  String imagePath = '';
  void getimage(ImageSource imageSource) async {
    // ignore: unused_local_variable
    XFile? imagepick = await ImagePicker().pickImage(source: imageSource);
    if (imagepick != null) {
      imageshow.value = imagepick.path;
      imagePath = imagepick.path;
    } else {
      Get.snackbar("error", 'No image seleccted',
          backgroundColor: Colors.amber);
    }
  }

  imageuplode() async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDicImage = referenceRoot.child("image");
    Reference referenceImageUplod =
        referenceDicImage.child(auth.currentUser!.uid);

    // uplode image firebasestorege
    try {
      await referenceImageUplod.putFile(File(imagePath));

      selectimagepath = await referenceImageUplod.getDownloadURL();
    } catch (e) {
      Get.snackbar("error", 'image is no uploded');
    }
  }

  // updateemployea(BuildContext context) async {
  //   // ignore: unused_local_variable
  //   try {
  //     loading.value = true;
  //     await imageuplode();
  //     EmployesDetailsModel employeobj = EmployesDetailsModel(
  //       work: works,
  //         imageUrl: image!.path,
  //         fullname: name.text,
  //         phonenumber: phone.text,
  //         sex: sex,
  //         age: ages.text,
  //         address: address.text,
  //         experience: experience.text,
  //         district: district.text,
  //         state: state.text);
  //     await edb
  //         .collection('Employes')
  //         .doc(auth.currentUser?.uid)
  //         .collection('EmployesDetails')
  //         .add(employeobj.ttomap());
  //     loading.value = false;
  //     Get.snackbar("Successful ", "Your Data");
  //      Navigator.pop(context);
  //   } catch (e) {
  //     // ignore: unnecessary_brace_in_string_interps
  //     Get.snackbar("Error", '${e}');
  selectdestrict(String data) {
    district = data;
  }

  //   }
  // }
  updateemployea() async {
    // ignore: unused_local_variable
    try {
      loading.value = true;
      await imageuplode();
      EmployesDetailsModel employeobj = EmployesDetailsModel(
          work: works.first['name'],
          imageUrl: selectimagepath,
          fullname: name.text,
          phonenumber: phone.text,
          sex: sex,
          age: ages.text,
          address: address.text,
          experience: experience.text,
          district: district,
          state: state.text);
      await edb
          .collection('Employes')
          .doc(auth.currentUser?.uid)
          .collection('EmployesDetails')
          .doc('name')
          .set(employeobj.ttomap());
      loading.value = false;
      Get.snackbar("Successful ", "Your Data");
      Get.to(const HiddenDrawer());
    } catch (e) {
      // ignore: unnecessary_brace_in_string_interps
      Get.snackbar("Error", 'b${e}');
    }
  }

  Stream<DocumentSnapshot> getEmployeesDetailsStream() {
    try {
      // Build the reference to the collection and document
      // final collectionReference = FirebaseFirestore.instance
      //     .collection('Employes')
      //     .doc(auth.currentUser?.uid)
      //     .collection('EmployesDetails');
      // final documentReference = collectionReference.doc(auth.currentUser?.uid);
      // final subcollectionReference =
      //     documentReference.collection('EmployesDetails');

      // // Return the snapshots stream
      // return subcollectionReference.snapshots();
      final collectionReference = FirebaseFirestore.instance
          .collection('Employes')
          .doc(auth.currentUser?.uid).snapshots();
      return collectionReference;    
    } catch (e) {
      // Handle any errors that occur during the stream creation
      Get.snackbar("Error", "$e");
      // ignore: prefer_const_constructors
      return Stream.empty();
    }
  }
}
