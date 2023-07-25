import 'package:flutter/material.dart';
import 'package:homesefty/core/Colors%20,%20Width%20,%20Hight/colors&size.dart';

import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Design%20Page/loginpage.dart';
import 'package:lottie/lottie.dart';

class AdminSignPage extends StatelessWidget {
  const AdminSignPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                hight30, hight30,

                Container(
                  width: _mediaqury.size.width * 0.80,
                  height: _mediaqury.size.width * 0.50,
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
                const TextFormfildWidget(
                    hinttext: 'Name', Iconss: Icon(Icons.mail)),
                const TextFormfildWidget(
                    hinttext: 'E-mail', Iconss: Icon(Icons.mail)),
                TextFormfildWidget(
                    hinttext: 'Password', Iconss: Icon(Icons.lock)),

                hight10,
                SizedBox(
                  width: _mediaqury.size.width * 0.9,
                  height: _mediaqury.size.height * 0.05,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign Up",
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
}
