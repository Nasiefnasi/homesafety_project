// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:homesefty/VIEW/Design%20Page/Hive/user_model.dart';
// import 'package:get/get.dart';                                                                                     
// import 'package:hive/hive.dart';
import 'package:homesefty/controller/user/getxController/authcontroler/authcontroler.dart';
import 'package:homesefty/core/size/colors&size.dart';

import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Design%20Page/forgotPassword.dart';
import 'package:homesefty/view/Design%20Page/sign_inPage.dart';

import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final crotl = Get.put(Authcontroller());
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getdetailsdatabase();
  }

  String? getemail;
  String? getpassword;
  // void setdetaildatabse(
  //   String emaildata,
  //   String passworddata,
  // ) async {
  //   final pref = await SharedPreferences.getInstance();
  //   await pref.setString("emailKey", emaildata.toString());
  //   await pref.setString("passwordKey", passworddata.toString());

  // }

  void getdetailsdatabase() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString("emailKey");
    final savedPassword = prefs.getString("passwordKey");

    if (savedEmail != null && savedPassword != null) {
      crotl.loginemail.text = savedEmail;
      crotl.loginpassword.text = savedPassword;
      getemail = savedEmail;
      getpassword = savedPassword;

      crotl.signIn(context);

      //  getemail = savedEmail.toString();
      //  getpassword = savedPassword.toString();
    }
  }

  // late Box box1;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  // void createBox() async {
  //   box1 = await Hive.openBox('logindata');
  //   getdata();
  // }

  // void getdata() async {
  //   if (box1.get("email") != null) {
  //     crotl.loginemail = box1.get("email");
  //         // ischeking = true;
  //         setState(() {

  //         });

  //   }
  //   if (box1.get("Password") != null) {
  //     crotl.loginpassword = box1.get("Password");
  //   }
  // }
  // final crotl = Get.put(Authcontroller());

  // late Box box1;
  // bool ischeking = false; // Move this declaration here

  // @override
  // void initState() {
  //   super.initState();
  //   createBox();
  //   // Initialize the Hive box in initState
  // }

  // void createBox() async {
  //   box1 = await Hive.openBox('logindata');

  // }

  // getdata() async {
  //   if (box1.get("email") != null) {
  //     crotl.loginemail = box1.get("email");
  //   }
  //   if (box1.get("Password") != null) {
  //     crotl.loginpassword = box1.get("Password");
  //   }
  // }

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
                     
                      const Spacer(),
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
                      ),
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
