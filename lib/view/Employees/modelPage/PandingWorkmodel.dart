import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:homesefty/core/Colors%20,%20Width%20,%20Hight/colors&size.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/notcompletedlist.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/paymentRequestPage.dart';
import 'package:lottie/lottie.dart';

class PandingworkStatusPPage extends StatelessWidget {
  const PandingworkStatusPPage({super.key});

  @override
  Widget build(BuildContext context) {
    void _showbottomsheet() {
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
            height: 600,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  child: Image.asset(
                      'asset/animation/infographic_circle_01-01.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    ' Work\nStatus',
                    style: TextStyle(fontSize: 33, fontWeight: FontWeight.w900),
                  ),
                ),
                Container(
                  width: 600,
                  height: 600,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 22, top: 95),
                          child: SizedBox(
                              height: 45,
                              width: 170,
                              child: ElevatedButton(
                                  style: const ButtonStyle(
                                      elevation: MaterialStatePropertyAll(5),
                                      shadowColor:
                                          MaterialStatePropertyAll(Colors.grey),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color.fromARGB(255, 240, 17, 80))),
                                  onPressed: () {},
                                  child: const Text(
                                    'Start',
                                    style: TextStyle(fontSize: 20),
                                  ))),
                        ),
                        hight10,
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 50,
                          ),
                          child: Container(
                            child: Lottie.asset(
                                'asset/animation/animation_lk3s1v1o.json'),
                            width: 110,
                            height: 110,
                            // color: Colors.amberAccent,
                          ),
                        ),
                        hight10,
                        GestureDetector(
                          onTap: () => Container(),
                          // () => Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) =>,
                          //     )),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 50),
                            child: Text(
                              '         Works \n Not Completed',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 22, top: 10),
                          child: SizedBox(
                              height: 45,
                              width: 170,
                              child: ElevatedButton(
                                  style: const ButtonStyle(
                                    elevation: MaterialStatePropertyAll(5),
                                    shadowColor:
                                        MaterialStatePropertyAll(Colors.grey),
                                    backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(255, 17, 181, 240),
                                    ),
                                  ),
                                  onPressed: () => Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PaymentRequest(),
                                      ),
                                      (route) => false),
                                  child: const Text(
                                    'End',
                                    style: TextStyle(fontSize: 20),
                                  ))),
                        ),
                      ]),
                )
              ],
            ),
          );
        },
      );
    }

    return GestureDetector(
      onTap: () {
        _showbottomsheet();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          width: double.infinity,
          height: 90,
          child: Card(
            color: Color.fromARGB(255, 227, 227, 227),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            shadowColor: Colors.grey,
            elevation: 5,
            child: const Row(
              children: [
                Width10,
                CircleAvatar(
                  child: CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.white,
                  ),
                  radius: 30,
                ),
                Width20,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Name :',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    hight5,
                    Text(
                      'Address :',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    hight5,
                    Text(
                      'Age :',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 8,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
