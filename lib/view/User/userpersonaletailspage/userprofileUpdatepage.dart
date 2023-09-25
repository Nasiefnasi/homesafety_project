// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/user/getxController/gextuserprofile/userdetailsstoredb.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class UpdateUsersProfilePage extends StatelessWidget {
  UpdateUsersProfilePage({super.key, });

  var cotrol = Get.put(UserDetailscontroler());
  // final Map<String, dynamic> details;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaqury = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const NewDrawer(),
        body: SafeArea(
          child: Form(
              key: formkey,
              child:
                  // StreamBuilder<QuerySnapshot>(
                  //     stream: FirebaseFirestore.instance
                  //         .collection('userdetails')
                  //         .snapshots(),
                  //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  //       if (snapshot.connectionState == ConnectionState.waiting) {
                  //         return CircularProgressIndicator();
                  //       }
                  //       if (snapshot.hasError) {
                  //         return const Text('Error');
                  //       }
                  //       return
                  ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: mediaqury.width * .4,
                          width: mediaqury.height * .1,
                          child: Lottie.asset(
                              'asset/animation/animation_lk3s1v1o.json'),
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
                          validatormessage: 'Enter Your Name',
                          keybord: TextInputType.name,
                          contros: cotrol.uesrfullname,
                          hinttext: 'Name'
                          // snapshot.data!.docs.first['state'],
                          ),

                      DetailsProfilepage(
                        validatormessage: 'Enter Your Address',
                        line: 5,
                        keybord: TextInputType.streetAddress,
                        contros: cotrol.address,
                        hinttext: "Address",
                        // hinttext:
                        // snapshot.data!.docs.first['fullname'].toString(),
                      ),
                      DetailsProfilepage(
                          validatormessage: 'Update Your Phone Number',
                          keybord: TextInputType.phone,
                          contros: cotrol.phonenumber,
                          hinttext:'Phone Number'
                          //     snapshot.data!.docs.first['address'].toString(),
                          ),
                      DetailsProfilepage(
                          validatormessage: 'Enter Your email',
                          keybord: TextInputType.emailAddress,
                          contros: cotrol.email,
                          hinttext:'E-mail'
                          //     snapshot.data!.docs.first['phonenumber'].toString(),
                          ),
                      DetailsProfilepage(
                          validatormessage: 'Enter Your district',
                          keybord: TextInputType.text,
                          contros: cotrol.district,
                          hinttext: 'District'
                          // snapshot.data!.docs.first['email'].toString(),
                          ),
                      DetailsProfilepage(
                          validatormessage: 'Enter Your state',
                          keybord: TextInputType.text,
                          contros: cotrol.state,
                          hinttext: 'state'
                          //     snapshot.data!.docs.first['district'].toString(),
                          ),

                      hight30,

                      SizedBox(
                        width: mediaqury.width * 0.9,
                        height: mediaqury.height * 0.05,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              await oncheckupdate(context);
                            } else {
                              Get.snackbar("title", "message");
                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => BottoNavBar(),
                              //     ),
                              //     (route) => false);
                              //  await cotrol.adduserdetails();
                            }
                          },
                          child: cotrol.loading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.amber,
                                )
                              : const Text(
                                  "Save Details",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                        ),
                      ),
                      hight30,

                      // TextFormfildWidget(hinttext: '', Iconss: Icons.abc_outlined)
                    ],
                  ),
                ],
              )
              // }
              ),
          // )),
        ));
  }

  Future<void> oncheckupdate(BuildContext context) async {
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
      await cotrol.updateuserdetails(context);
      Get.snackbar("Profile Update", "Successfull");
         await cotrol.updateuserdetails(context);
    cotrol.uesrfullname.clear();
    cotrol.address.clear();
    cotrol.email.clear();
    cotrol.phonenumber.clear();
    cotrol.district.clear();
    cotrol.state.clear();
    }
    // await cotrol.updateuserdetails(context);
    // cotrol.uesrfullname.clear();
    // cotrol.address.clear();
    // cotrol.email.clear();
    // cotrol.phonenumber.clear();
    // cotrol.district.clear();
    // cotrol.state.clear();
  }
}
