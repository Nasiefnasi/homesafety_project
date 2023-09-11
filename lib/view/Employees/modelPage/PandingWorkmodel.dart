// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/employes/chat/chat.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/chatPage.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/paymentRequestPage.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PandingworkStatusPPage extends StatelessWidget {
  PandingworkStatusPPage({super.key, required this.data});
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
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
                SizedBox(
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
                SizedBox(
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
                          child: SizedBox(
                            width: 110,
                            height: 110,
                            child: Lottie.asset(
                                'asset/animation/animation_lk3s1v1o.json'),
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
                                  onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PaymentRequest(),
                                        ),
                                      ),
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

    return Consumer<EmployeChating>(builder: (context, value, child) {
      return GestureDetector(
        onTap: () {
          _showbottomsheet();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            width: double.infinity,
            height: 90,
            child: Card(
              color: const Color.fromARGB(255, 227, 227, 227),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              shadowColor: Colors.grey,
              elevation: 5,
              child: Row(
                children: [
                  Width20,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Name : ${data['username']}',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      hight5,
                      Text(
                        'Address : ${data['useraddress']}',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      hight5,
                      Text(
                        'Work Date : ${data['workdate']}',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () async {
                      await  value.getreceiverId(data['userid'].toString());
                      print("${data['userid'].toString()}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeereeeeeeeeeeeeeeeeeeeeeeeeeeeefasdfsadf");
                      print(data['userid'].toString());
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EmployChatPage(
                              receiverUserEmail:
                                  auth.currentUser!.email.toString(),
                              receiverUserId: data['userid'].toString()),
                        ));
                      },
                      icon: Icon(
                        Icons.wechat_sharp,
                        size: 40,
                        color: Colors.green,
                      )),
                  Width10,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        radius: 30,
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                              NetworkImage("${data['userimageurl']}"),
                          backgroundColor: Colors.transparent,
                        )),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: Column(
                  //     children: [
                  //       CircleAvatar(
                  //         backgroundColor: Colors.green,
                  //         radius: 8,
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
