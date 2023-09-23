import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/user/getxController/authcontroler/authcontroler.dart';
import 'package:homesefty/core/size/colors&size.dart';

import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Design%20Page/forgotPassword.dart';
import 'package:homesefty/view/Design%20Page/sign_inPage.dart';

import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final crotl = Get.put(Authcontroller());

  @override
  Widget build(BuildContext context) {
    var mediaqury = MediaQuery.of(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,

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
                  "Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                hight10,
                const Text(
                  "please login to continue using our app",
                  style: TextStyle(color: kGreycolor),
                ),
                hight20,
                TextFormfildWidget(
                    contro: crotl.loginemail,
                    hinttext: 'E-mail',
                    Iconss: const Icon(Icons.mail)),
                TextFormfildWidget(
                    contro: crotl.loginpassword,
                    hinttext: 'Password',
                    Iconss: const Icon(Icons.lock)),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage(),
                              ));
                        },
                        child: const Text(
                          "forgot password",
                          style: TextStyle(color: kbuttoncolorblue),
                        ),
                      )
                    ],
                  ),
                ),
                Obx(
                  () => SizedBox(
                    width: mediaqury.size.width * 0.9,
                    height: mediaqury.size.height * 0.05,
                    child: ElevatedButton(
                      onPressed: () {
                        crotl.signIn(context);
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const EmployeProfilePage(),
                        //     ),
                        //     (route) => false);
                      },
                      child: crotl.loading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Login",
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
                      "Don't have an account?",
                      style: TextStyle(color: kGreycolor),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignPage(),
                            ));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
                hight30,
              ],
            ),
          ),
        ],
      )),
    );
  }
}
