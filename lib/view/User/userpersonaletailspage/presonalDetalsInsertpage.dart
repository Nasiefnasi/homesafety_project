// ignore_for_file: file_names, unused_local_variable
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/user/getxController/gextuserprofile/userdetailsstoredb.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class UserpersonalDetailesPage extends StatelessWidget {
  UserpersonalDetailesPage({super.key});

  var cotrol = Get.put(UserDetailscontroler());
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaqury = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: formkey,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: mediaqury.width * .4,
                    width: mediaqury.height * .1,
                    child:
                        Lottie.asset('asset/animation/animation_lk3s1v1o.json'),
                  ),
                ),
                hight10,
                Container(
                  clipBehavior: Clip.none,
                  width: mediaqury.width * 0.4,
                  height: mediaqury.height * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 5,
                          color: const Color.fromARGB(255, 71, 33, 33))),
                  child: Obx(
                    () => cotrol.imageshow.value == ''
                        ? const Center(child: Text('Select mage'))
                        // :Image.network(cotrol.selectimagepath),
                        : Image.file(File(cotrol.imageshow.value),
                            fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: mediaqury.width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {
                      cotrol.getimage(ImageSource.camera);
                    },
                    child: const Text('add image'),
                  ),
                ),
                DetailsProfilepage(
                  validatormessage: 'Enter Name',
                  keybord: TextInputType.name,
                  contros: cotrol.uesrfullname,
                  hinttext: 'Full Name',
                ),
                DetailsProfilepage(
                  validatormessage: 'Enter Address',
                  keybord: TextInputType.streetAddress,
                  contros: cotrol.address,
                  hinttext: 'Address ',
                  line: 5,
                ),
                DetailsProfilepage(
                  validatormessage: "Enter phone number",
                  keybord: TextInputType.phone,
                  contros: cotrol.phonenumber,
                  hinttext: 'Phone Number',
                ),
                DetailsProfilepage(
                  validatormessage: 'enter email',
                  keybord: TextInputType.emailAddress,
                  contros: cotrol.email,
                  hinttext: 'Email',
                ),
                DetailsProfilepage(
                  validatormessage: 'entre District',
                  keybord: TextInputType.text,
                  contros: cotrol.district,
                  hinttext: 'District',
                ),
                DetailsProfilepage(
                  validatormessage: 'enter state',
                  keybord: TextInputType.text,
                  contros: cotrol.state,
                  hinttext: 'State',
                ),

                hight30,

                SizedBox(
                  width: mediaqury.width * 0.9,
                  height: mediaqury.height * 0.05,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        await buttononcheck();
                      } else {
                        Get.snackbar("Error", "Enter your Details");
                  
                      }
                    },
                    child: cotrol.loading.value
                        ? const CircularProgressIndicator(
                            color: Colors.amber,
                          )
                        : const Text(
                            "Save Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                  ),
                ),
                hight30,

                
              ],
            ),
          ],
        ),
      )),
    );
  }

  Future<void> buttononcheck() async {
    final name = cotrol.uesrfullname.text.trim();
    final address = cotrol.address.text.trim();
    final phone = cotrol.phonenumber.text.trim();
    final email = cotrol.email.text.trim();
    final district = cotrol.district.text.trim();
    final state = cotrol.state.text.trim();
    if (name.isEmpty ||
        address.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        district.isEmpty ||
        state.isEmpty) {
      return;
    } else {
      Get.snackbar("Message", "Successfull");
    }
    await cotrol.adduserdetails();
    cotrol.uesrfullname.clear();
    cotrol.address.clear();
    cotrol.email.clear();
    cotrol.phonenumber.clear();
    cotrol.district.clear();
    cotrol.state.clear();
  }
}
