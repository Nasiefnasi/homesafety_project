// ignore_for_file: file_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:homesefty/controller/user/getxController/authcontroler/authcontroler.dart';
import 'package:homesefty/core/size/colors&size.dart';

import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Design%20Page/loginpage.dart';
// import 'package:homesefty/view/Employees/profilePage/employeprofiledetailspageinsert.dart';
// import 'package:homesefty/view/User/userpersonaletailspage/presonalDetalsInsertpage.dart';
import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';

class SignPage extends StatelessWidget {
  SignPage({super.key});
  final cortl = Get.put(Authcontroller());
  @override
  Widget build(BuildContext context) {
    var mediaqury = MediaQuery.of(context);
    return
        // Consumer<Authcontroler>(builder: (context, authcnrolobj, child) { return
        Scaffold(
      // resizeToAvoidBotto     mInset: false,

      body: SafeArea(
          child: ListView(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hight30, 

                // ignore: sized_box_for_whitespace
                Container(
                  width: mediaqury.size.width * 0.80,
                  height: mediaqury.size.width * 0.50,
                  child:
                      Lottie.asset('asset/animation/animation_lk3s1v1o.json'),
                ),
                hight30,

                // https://asset-cdn.lottiefiles
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                hight5,
                const Text(
                  "Please fill the details and create account",
                  style: TextStyle(color: kGreycolor),
                ),
                hight20,

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     SizedBox(
                //         height: _mediaqury.size.height * 0.04,
                //         width: _mediaqury.size.width * 0.4,
                //         child: ElevatedButton(
                //             onPressed: () {},
                //             child: Text(
                //               'USER',
                //               style: TextStyle(
                //                   fontWeight: FontWeight.w400, fontSize: 18),
                //             ))),
                //     SizedBox(
                //         height: _mediaqury.size.height * 0.04,
                //         width: _mediaqury.size.width * 0.4,
                //         child: ElevatedButton(
                //             onPressed: () {},
                //             child: Text(
                //               'Employees',
                //               style: TextStyle(
                //                   fontWeight: FontWeight.w400, fontSize: 18),
                //             ))),
                //   ],
                // ),
                TextFormfildWidget(
                  contro: cortl.username,
                  hinttext: 'Name',
                  Iconss: const Icon(Icons.person),
                ),
                TextFormfildWidget(
                  contro: cortl.email,
                  hinttext: 'E-mail',
                  Iconss: const Icon(Icons.mail),
                ),
                TextFormfildWidget(
                  contro: cortl.password,
                  hinttext: 'Password',
                  Iconss: const Icon(Icons.lock),
                ),

                hight10,

                Obx(
                  () => SizedBox(
                    width: mediaqury.size.width * 0.9,
                    height: mediaqury.size.height * 0.05,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Provider.of<Authcontroler>(context,listen: false).singup(context);
                        // await cortl.signup();
                        _showbottomsheett(context);
                      },
                      child: cortl.loading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                    ),
                  ),
                ),

                hight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: kGreycolor),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                            (route) => false);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  void _showbottomsheett(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
      ),
      elevation: 50,
      backgroundColor: const Color.fromARGB(38, 22, 23, 23),
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.0),
                  topLeft: Radius.circular(50.0)),
              color: Color.fromARGB(255, 254, 254, 254)),
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () async {
                        await cortl.usersignup('employess');
                        // Get.to(const EmployeProfilePage());
                      },
                      child: const Text('Employess'),
                      style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 8, 105, 134)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))))),
              SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () async {
                        await cortl.usersignup('user');
                        // Get.to(UserpersonalDetailesPage());
                      },
                      child: const Text('User'),
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.amber),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))))),
            ],
          ),
        );
      },
    );
  }
}
