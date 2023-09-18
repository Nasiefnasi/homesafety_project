// ignore_for_file: file_names, annotate_overrides, prefer_final_fields, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/employes/employeWorkConform/employeconformwork.dart';
import 'package:homesefty/controller/employes/notCompleted/workNotCompleted.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/hiddenDrawer.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';
import 'package:provider/provider.dart';

class WorkConformationpage extends StatefulWidget {
  const WorkConformationpage({
    super.key,
    required this.datas,
  });
  final Map<String, dynamic> datas;

  @override
  State<WorkConformationpage> createState() => _WorkConformationpageState();
}

class _WorkConformationpageState extends State<WorkConformationpage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    showDialogfuntion(BuildContext context) async {
                              await showDialog<String>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Consumer<WorkNotCompleted>(
                                      builder: (context, value, child) {
                                    return AlertDialog(
                                      contentPadding:
                                          const EdgeInsets.all(16.0),
                                      content: Form(
                                        key:
                                            _formKey, // Assign the _formKey to the Form
                                        autovalidateMode: AutovalidateMode
                                            .onUserInteraction, // Enables auto-validation
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(
                                              controller: value.comments,
                                              autofocus: true,
                                              validator: (text) {
                                                if (text!.isEmpty) {
                                                  return 'Please enter a comment';
                                                }
                                                return null; // Return null if the input is valid
                                              },
                                              decoration: const InputDecoration(
                                                labelText:
                                                    'Enter your Comment here',
                                                hintText: 'Why Not completed',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Rejected'),
                                          onPressed: () async {
                                            // Check if the form is valid before proceeding
                                            if (_formKey.currentState!
                                                .validate()) {
                                              await value.addOnfirebase(
                                                      widget.datas['userid'],
                                                      widget.datas['username'],
                                                      widget.datas['employName'],
                                                      widget.datas['userimagurl'],
                                                      widget.datas['employurl']);

                                              Get.snackbar(
                                                "${widget.datas['username']}",
                                                "This Work is Rejected",
                                                backgroundColor: const Color.fromARGB(
                                                    244, 5, 85, 79),
                                              );
                                              value.comments.clear();

                                              Navigator.pop(context);
                                            }
                                          },
                                        )
                                      ],
                                    );
                                  });
                                },
                              );
                            }
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
        child: Consumer2<conformworkdatasave, WorkNotCompleted>(
            builder: (context, value, notCompletedobj, child) {
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
                              padding: const EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(50), // Image border
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(40), // Image radius
                                  child: Image.network(
                                      widget.datas['userimagurl'],
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
                  EmployesWorkConformation(hinttext: widget.datas['username']),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Address",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  EmployesWorkConformation(
                    hinttext: widget.datas['address'],
                    line: 160,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Phone Number",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  EmployesWorkConformation(hinttext: widget.datas['phone']),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                            const Padding(
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
                                          widget.datas['date'],
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
                          onPressed: ()async {


                           await  showDialogfuntion(context);







                            // ignore: unused_element
                            // showDialogfuntion(BuildContext context) async {
                            //   await showDialog<String>(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return Consumer<WorkNotCompleted>(
                            //           builder: (context, value, child) {
                            //         return AlertDialog(
                            //           contentPadding:
                            //               const EdgeInsets.all(16.0),
                            //           content: Form(
                            //             key:
                            //                 _formKey, // Assign the _formKey to the Form
                            //             autovalidateMode: AutovalidateMode
                            //                 .onUserInteraction, // Enables auto-validation
                            //             child: Column(
                            //               mainAxisSize: MainAxisSize.min,
                            //               children: [
                            //                 TextFormField(
                            //                   controller: value.comments,
                            //                   autofocus: true,
                            //                   validator: (text) {
                            //                     if (text!.isEmpty) {
                            //                       return 'Please enter a comment';
                            //                     }
                            //                     return null; // Return null if the input is valid
                            //                   },
                            //                   decoration: const InputDecoration(
                            //                     labelText:
                            //                         'Enter your Comment here',
                            //                     hintText: 'Why Not completed',
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //           actions: <Widget>[
                            //             TextButton(
                            //               child: const Text('Rejected'),
                            //               onPressed: () async {
                            //                 // Check if the form is valid before proceeding
                            //                 if (_formKey.currentState!
                            //                     .validate()) {
                            //                   await notCompletedobj.addOnfirebase(
                            //                           widget.datas['userid'],
                            //                           widget.datas['username'],
                            //                           widget.datas['employName'],
                            //                           widget.datas['userimagurl'],
                            //                           widget.datas['employurl']);

                            //                   Get.snackbar(
                            //                     "${widget.datas['username']}",
                            //                     "This Work is Rejected",
                            //                     backgroundColor: Color.fromARGB(
                            //                         244, 5, 85, 79),
                            //                   );
                            //                   value.comments.clear();

                            //                   Navigator.pop(context);
                            //                 }
                            //               },
                            //             )
                            //           ],
                            //         );
                            //       });
                            //     },
                            //   );
                            // }

                            // notCompletedobj.addOnfirebase(
                            //     datas['userid'],
                            //     datas['username'],
                            //     datas['employName'],
                            //     datas['userimagurl'],
                            //     datas['employurl']);
                          },
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
                            value.userdetails(
                                widget.datas['date'],
                                widget.datas['userimagurl'],
                                widget.datas['username'],
                                widget.datas['address'],
                                widget.datas['employid'],
                                widget.datas['userid']);

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
