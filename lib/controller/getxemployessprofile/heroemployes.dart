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
// import 'package:provider/provider.dart';

class EmployesDetailsControl extends GetxController {
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
  List<String> works = [];
  TextEditingController experience = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController state = TextEditingController();
  var loading = false;

  addemployea() async {
    // ignore: unused_local_variable
    try {
      loading = true;
      await imageuplode();
      EmployesDetailsModel employeobj = EmployesDetailsModel(
          imageUrl: image!.path,
          fullname: name.text,
          phonenumber: phone.text,
          sex: sex,
          age: ages.text,
          address: address.text,
          experience: experience.text,
          district: district.text,
          state: state.text);
      await edb
          .collection('Employes')
          .doc(auth.currentUser!.uid)
          .collection('userDetails')
          .add(employeobj.tomap());
      loading = false;
      Get.snackbar("Successful ", "Your Data");
    } catch (e) {
      // ignore: unnecessary_brace_in_string_interps
      Get.snackbar("Error", '${e}');
      Get.to(const HiddenDrawer());
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

  updateemployea() async {
    // ignore: unused_local_variable
    try {
      loading = true;
      await imageuplode();
      EmployesDetailsModel employeobj = EmployesDetailsModel(
          imageUrl: image!.path,
          fullname: name.text,
          phonenumber: phone.text,
          sex: sex,
          age: ages.text,
          address: address.text,
          experience: experience.text,
          district: district.text,
          state: state.text);
      await edb
          .collection('Employes')
          .doc(auth.currentUser!.uid)
          .collection('userDetails')
          .add(employeobj.tomap());
      loading = false;
      Get.snackbar("Successful ", "Your Data");
    } catch (e) {
      // ignore: unnecessary_brace_in_string_interps
      Get.snackbar("Error", '${e}');
      Get.to(const HiddenDrawer());
    }
  }

  // List<Map> categories = [
  //   {'name': 'plumber', 'ischecked': false},
  //   {'name': 'dssdmber', 'ischecked': false},
  //   {'name': 'dsdsvdser', 'ischecked': false},
  //   {'name': 'plsdvsdver', 'ischecked': false},
  //   {'name': 'bnfr', 'ischecked': false},
  //   {'name': 'ppdsdsumber', 'ischecked': false},
  //   {'name': 'wmber', 'ischecked': false},
  // ].obs;
  // Column Employeeswork(List<Map> hello) {
  //   return Column(
  //       children: hello.obs.map(
  //     (favoritevalu) {
  //       return CheckboxListTile(
  //         checkboxShape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  //         title: Text(favoritevalu['name']),
  //         value: favoritevalu['ischecked'],
  //         onChanged: (val) {
  //           favoritevalu['ischecked'] = val;
  //         },
  //       );
  //     },
  //   ).toList());
  // }
}
