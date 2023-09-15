import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/employes/workStatus/level.dart';
import 'package:homesefty/controller/user/chatpage/chating.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/chatPage.dart';
import 'package:homesefty/view/User/designPage/chatinguser.dart';
import 'package:provider/provider.dart';

class UserStatusLevel extends StatefulWidget {
  UserStatusLevel({super.key, required this.datas});
  final Map<String, dynamic> datas;

  @override
  State<UserStatusLevel> createState() => _UserStatusLevelState();
}

class _UserStatusLevelState extends State<UserStatusLevel> {
  // final Names;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = "${widget.datas['employid']}${auth.currentUser!.uid}";
    // ignore: no_leading_underscores_for_local_identifiers
    void _showbottomStatusLeve() {
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
                color: Color.fromARGB(255, 241, 246, 242),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            width: double.infinity,
            height: 250,
            child: Column(children: [
              hight20,
              GestureDetector(
                onTap: () async {},
                child: const Text(
                  'Start ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 255, 160, 7)),
                ),
              ),
              hight20,
              Stack(
                alignment: Alignment.center,
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 230),
                      child: Text(
                        ' Not\nCompleted',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.red),
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 200),
                      child: Text(
                        'Working',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 12, 63, 140)),
                      ),
                    ),
                  ),
                  Consumer<EmployStatusLevel>(builder: (context, value, child) {
                    return Container(
                        height: 100,
                        width: 100,
                        child: AnimatedRotation(
                            turns: value.turne,
                            duration: const Duration(seconds: 5),
                            child: Image.asset(
                              "asset/animation/arrow-01.png",
                              fit: BoxFit.cover,
                            )));
                  }),
                ],
              ),
              hight20,
              const Center(
                child: Text(
                  'Work Completed',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 2, 102, 2)),
                ),
              ),
            ]),
          );
        },
      );
    }

    return Consumer<UserChating>(builder: (context, value, child) {
      return SizedBox(
        height: 90,
        // color: Colors.amber,
        width: double.infinity,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundColor: const Color.fromARGB(255, 29, 26, 1),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(widget.datas['employimageurl']),
                  backgroundColor: const Color.fromARGB(0, 111, 8, 8),
                ),
              ),
              title: Text(
                '${widget.datas['employename']} ',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text(
                'Date: ${widget.datas['workdate']}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              trailing: IconButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Select your Option'),
                          shadowColor: Colors.black,
                          actions: [
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () async {
                                      await Provider.of<EmployStatusLevel>(
                                              context,
                                              listen: false)
                                          .getfetchData(widget.datas['employid']
                                              .toString());

                                      Get.put(_showbottomStatusLeve());
                                    },
                                    child: const Text(
                                      "Status Level",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 3, 108, 6),
                                          fontSize: 20),
                                    )),
                                const Divider(thickness: 2),
                                TextButton(
                                    onPressed: () async {
                                      // await value.getuserreceiverId(
                                      //     datas['employid'].toString());
                                      print(
                                          "${widget.datas['employid'].toString()}UUUUUUUUUUUUUUUUUUUUUUUUUUUUUeeereeeeeeeeeeeeeeeeeeeeeeeeeeeefasdfsadf");

                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) {
                                          return USerChatPage(
                                            receiverUserEmail: widget
                                                .datas['employename']
                                                .toString(),
                                            receiverUserId: widget
                                                .datas['employid']
                                                .toString(),
                                          );
                                        },
                                      ));
                                    },
                                    child: const Text(
                                      "   Chat",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 3, 108, 6),
                                          fontSize: 20),
                                    )),
                              ],
                            )
                          ],
                        );
                        // );
                        // child: AlertDialog(
                        //   title: Text('Welcome'),
                        //   content: Text('GeeksforGeeks'),
                        //   actions: [
                        //     ElevatedButton(
                        //       // textColor: Colors.black,
                        //       onPressed: () {},
                        //       child: Text('CANCEL'),
                        //     ),
                        //     ElevatedButton(
                        //       // textColor: Colors.black
                        //       onPressed: () {},
                        //       child: Text('ACCEPT'),
                        //     ),
                        //   ],
                        // ),
                        // );
                      },
                    );
                  },
                  icon: const Icon(Icons.more_vert_rounded)),
            ),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Width10,
            //     CircleAvatar(
            //       child: CircleAvatar(
            //         radius: 30,
            //         backgroundColor: Colors.amber,
            //       ),
            //       radius: 35,
            //     ),
            //     Width10,
            //     SizedBox(
            //       width: 120,
            //       child: Text(
            //         'Name',
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            //       ),
            //     ),
            //     Text(
            //       'Date',
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            //     ),
            //     Spacer(),
            //     Text(
            //       'Status',
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 15,
            //           color: Color.fromARGB(255, 43, 100, 147)),
            //     ),
            //     Width10,
            //   ],
            // ),
          ),
        ),
      );
    });
  }
}
