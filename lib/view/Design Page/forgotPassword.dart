// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/user/getxController/authcontroler/authcontroler.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/core/size/colors&size.dart';

class ForgotPasswordPage extends StatelessWidget {
   ForgotPasswordPage({super.key});
  final cntrol = Get.put(Authcontroller());

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.amber,
      body: SafeArea(
          // ignore: sized_box_for_whitespace
          child: Container(height: mediaquery.height,width: mediaquery.width,
            child: Column(
                  children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: mediaquery.height * .5,
                    color: const Color.fromARGB(255, 247, 214, 94),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: mediaquery.height * .35),
                  child: Container(
                    clipBehavior: Clip.none,
                    decoration: BoxDecoration(
                        // color: Color.fromARGB(127, 252, 251, 251),
                        borderRadius: BorderRadius.circular(20)),
                    height: mediaquery.height * .30,
                    width: mediaquery.width * .9,
                    child: Card(
                        // ignore: sort_child_properties_last
                        child: Column(
                          children: [
                            hight30,
                            const Text(
                              'Enter Your Email',
                              style: TextStyle( 
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            hight20,
                            TextFormfildWidget( contro: cntrol.resetmail,
                                hinttext: "E-mail", Iconss: const Icon(Icons.mail)),
                            ElevatedButton(
                                onPressed: () {
                                  cntrol.resetpassword();
                                 
                                
                                },
                                child:cntrol.loading.value? const CircularProgressIndicator(color: Colors.white,) : const Text("Send Rest Link")),
                          ],
                        ),
                        elevation: 5,
                        color: const Color.fromARGB(171, 254, 254, 253),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                )
              ],
            )
                  ],
                ),
          )),
    );
  }
}
