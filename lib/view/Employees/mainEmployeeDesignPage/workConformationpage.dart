// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/employes/employeWorkConform/employeconformwork.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/hiddenDrawer.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';
import 'package:provider/provider.dart';

class WorkConformationpage extends StatelessWidget {
  WorkConformationpage({
    super.key,
    required this.datas,
  });
  final Map<String, dynamic> datas;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    // DateTime seletetimedate = DateTime.now();
    // // ignore: unused_element
    // void selecttimeand() {
    //   showDatePicker(
    //           textDirection: TextDirection.rtl,
    //           context: context,
    //           initialDate: seletetimedate,
    //           firstDate: DateTime(2000),
    //           lastDate: DateTime(2025))
    //       .then((value) {
    //     seletetimedate = value!;
    //   });
    // }

    var mediaQury = MediaQuery.of(context);
    return Scaffold(
      drawer: const NewDrawer(),
      appBar: AppBar(
        title: const Center(child: Text('Conformation')),
        actions: const [Icon(Icons.dashboard_customize_rounded)],
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const HiddenDrawer();
                },
              ));
            },
            icon: const Icon(Icons.arrow_circle_left_sharp)),
      ),
      body: SafeArea(
        child: Consumer<conformworkdatasave>(builder: (context, value, child) {
          return ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      // color: Colors.amber,
                      height: mediaQury.size.height * .1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Width30,
                          IconButton(
                              iconSize: 30,
                              color: Colors.green,
                              onPressed: () {},
                              icon: const Icon(Icons.message)),
                          Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(50), // Image border
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(40), // Image radius
                                  child: Image.network(datas['userimagurl'],
                                      fit: BoxFit.cover),
                                ),
                              )
                              // CircleAvatar(
                              //   radius: 35,
                              // ),
                              ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Name",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  EmployesWorkConformation(hinttext: datas['username']),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Address",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  EmployesWorkConformation(
                    hinttext: datas['address'],
                    line: 160,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Phone Number",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  EmployesWorkConformation(hinttext: datas['phone']),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      // color: Colors.amber,
                      height: mediaQury.size.height * .2,
                      width: double.infinity,
                      child: Card(
                        color: Colors.grey[300],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            hight20,
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Schedule Time & Date',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            // Row(
                            //   children: [
                            //     Padding(
                            //       padding:  EdgeInsets.only(left: 20, top: 10),
                            //       child: SizedBox(
                            //         width: 180,
                            //         child: ElevatedButton(
                            //             onPressed: () {
                            //               selecttimeand();
                            //             },
                            //             child:  Text(
                            //               'Select Date',
                            //               style: TextStyle(
                            //                   fontWeight: FontWeight.bold,
                            //                   fontSize: 15),
                            //             )),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            hight5,
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 60,
                                    width: 180,
                                    child: Card(
                                      child: Center(
                                        child: Text(
                                          datas['date'],
                                          style: const TextStyle(fontSize: 22),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: SizedBox(
                                //     height: 60,
                                //     width: 150,
                                //     child: Card(
                                //       child: Center(
                                //         child: Text(
                                //           '${seletetimedate.hour} : ${seletetimedate.minute}',
                                //           style: const TextStyle(fontSize: 22),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // const Padding(
                  //   padding: EdgeInsets.only(left: 20),
                  //   child: Text(
                  //     "Payment",
                  //     style: TextStyle(fontSize: 20, color: Colors.grey),
                  //   ),
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: SizedBox(
                  //     height: 60,
                  //     width: double.infinity,
                  //     child: Card(
                  //       shadowColor: Colors.teal,
                  //       elevation: 5,
                  //       child: Padding(
                  //         padding: EdgeInsets.all(8.0),
                  //         child: Text(
                  //           'Price',
                  //           style: TextStyle(color: Colors.grey),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  hight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 180,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.orange[600])),
                          onPressed: () {},
                          child: const Text(
                            'Not Complete',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.lightGreenAccent[700])),
                          onPressed: () async {
                            //    final DocumentSnapshot snapshot =
                            //     await FirebaseFirestore.instance
                            //         .collection('userdetails')
                            //         .doc(auth.currentUser!.uid)
                            //         .get();
                            // if (snapshot.exists) {
                            //   // ignore: unused_local_variable
                            //   final Map<String, dynamic> data =
                            //       snapshot.data() as Map<String, dynamic>;
                            //   value.userdetails(
                            //       data['fullname'], data['imageUrl'], data['id']);
                            //   print('Full Name: ${data['fullname']}');
                            // } else {
                            //   print("document snapshot is error");
                            // }
                            final DocumentSnapshot snapshot =
                                await FirebaseFirestore.instance
                                    .collection('Employes')
                                    .doc(auth.currentUser?.uid)
                                    .get();
                            if (snapshot.exists) {
                              Map<String, dynamic> data =
                                  snapshot.data() as Map<String, dynamic>;
                              value.employdetails(
                                data['fullname'],
                                data['imageUrl'],
                                data['phonenumber'],
                              );
                            }
                            value.userdetails( datas['date'],datas['userimagurl'], datas['username'], datas['address'], datas['employid'],datas['userid']);

                            // value.userimagurl = datas['userimagurl'];
                            // value.username = datas['username'];
                            // value.useraddress = datas['address'];
                            // value.empolysid = datas['employid'];
                            // value.workdata = datas['date'];

                            await value.conformworkAdddetails();
                            Get.snackbar("Conform", "Your work");
                            Navigator.of(context).pop();
                            // value.
                          },
                          child: const Text(
                            'Complete',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  hight30,
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
