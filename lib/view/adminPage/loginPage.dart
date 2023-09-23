// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:homesefty/core/size/colors&size.dart';

import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Design%20Page/sign_inPage.dart';
import 'package:homesefty/view/Employees/profilePage/employeprofiledetailspageinsert.dart';
import 'package:lottie/lottie.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    var _mediaqury = MediaQuery.of(context);
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
                hight30,
                hight30,
                SizedBox(
                  width: _mediaqury.size.width * 0.80,
                  height: _mediaqury.size.width * 0.50,
                  child:
                      Lottie.asset('asset/animation/animation_lk3s1v1o.json'),
                ),
                hight30,
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
                const TextFormfildWidget(
                    hinttext: 'E-mail', Iconss: Icon(Icons.mail)),
                const TextFormfildWidget(
                    hinttext: 'E-mail', Iconss: Icon(Icons.mail)),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "forgot password",
                          style: TextStyle(color: kbuttoncolorblue),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: _mediaqury.size.width * 0.9,
                  height: _mediaqury.size.height * 0.05,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmployeProfilePage(),
                          ),
                          (route) => false);
                    },
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
              ],
            ),
          ),
        ],
      )),
    );
  }
}
