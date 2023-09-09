import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/user/getxController/gextuserprofile/storeuserdata.dart';
import 'package:homesefty/view/User/designPage/navBar/navbar.dart';
import 'package:image_picker/image_picker.dart';

class UserDetailscontroler extends GetxController {
  // step 1 create instance
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  File? image;
  TextEditingController uesrfullname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController state = TextEditingController();
  var loading = false.obs;

  // final formkey = GlobalKey<FormState>();

  // setp 2 create the funtion
  // create account with email and password
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

  adduserdetails() async {
    // ignore: unused_local_variable
    loading.value = true;
    await imageuplode();
    UserDetails userdetils = UserDetails(
        id: auth.currentUser?.uid,
        imageUrl: selectimagepath,
        fullname: uesrfullname.text,
        address: address.text,
        phonenumber: phonenumber.text,
        email: email.text,
        district: district.text,
        state: state.text);
    await db.collection('userdetails').doc(auth.currentUser?.uid).set(
          userdetils.tomap(),
        );
    loading.value = false;
    Get.snackbar('title', 'message');
    Get.to(BottoNavBar());

    // Reference referenceRoot = FirebaseStorage.instance.ref();
    // Reference referenceDicImage = referenceRoot.child("image");
    // Reference referenceImageUplod =
    //     referenceDicImage.child(auth.currentUser!.uid);

    // Store the image fs
  }

  updateuserdetails(BuildContext context) async {
    // ignore: unused_local_variable
    loading.value = true;
    await imageuplode();
    UserDetails userdetils = UserDetails(
        id: auth.currentUser?.uid,
        imageUrl: selectimagepath,
        fullname: uesrfullname.text,
        address: address.text,
        phonenumber: phonenumber.text,
        email: email.text,
        district: district.text,
        state: state.text);
    await db.collection('userdetails').doc(auth.currentUser?.uid).set(
          userdetils.tomap(),
        );
    loading.value = false;
    Navigator.pop(context);
  }
}
