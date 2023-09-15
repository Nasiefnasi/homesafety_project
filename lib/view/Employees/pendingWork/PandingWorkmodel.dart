// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously, unused_local_variable, unused_element, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
// import 'package:homesefty/VIEW/Employees/pendingWork/pendingworkForm.dart';
import 'package:homesefty/controller/employes/chat/chat.dart';
import 'package:homesefty/controller/employes/notCompleted/workNotCompleted.dart';
import 'package:homesefty/controller/employes/workStatus/level.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/chatPage.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/paymentRequestPage.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PandingworkStatusPPage extends StatefulWidget {
  PandingworkStatusPPage({super.key, required this.data});
  Map<String, dynamic> data = {};

  @override
  State<PandingworkStatusPPage> createState() => _PandingworkStatusPPageState();
}

class _PandingworkStatusPPageState extends State<PandingworkStatusPPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    showDialogfuntion(BuildContext context) async {
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return Consumer<WorkNotCompleted>(builder: (context, value, child) {
            return AlertDialog(
              contentPadding: const EdgeInsets.all(16.0),
              content: Form(
                key: _formKey, // Assign the _formKey to the Form
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
                        labelText: 'Enter your Comment here',
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
                    if (_formKey.currentState!.validate()) {
                      await value.addOnfirebase(
                        widget.data['userid'],
                        widget.data['username'],
                        widget.data['employename'],
                        widget.data['userimageurl'],
                        widget.data['employimageurl'],
                      );

                      Get.snackbar(
                        "${widget.data['username']}",
                        "This Work is Rejected",
                        backgroundColor: Color.fromARGB(244, 5, 85, 79),
                      );
                      value.comments.clear();

                      Navigator.pop(context);
                    }
                  },
                )
              ],
            );

            // AlertDialog(
            //   contentPadding: const EdgeInsets.all(16.0),
            //   content: Row(
            //     children: [
            //       Expanded(
            //         child: TextFormField(
            //           controller: value.comments,
            //           autofocus: true,
            //           validator: (text) {
            //             if (text!.isEmpty) {
            //               return 'Please enter a comment';
            //             }
            //             return null; // Return null if the input is valid
            //           },
            //           decoration: const InputDecoration(
            //             labelText: 'Enter your Comment here',
            //             hintText: 'Why Not completed',
            //           ),
            //         ),
            //       ),

            //     ],
            //   ),
            //   actions: <Widget>[
            //     // TextButton(
            //     //   child: const Text('CANCEL'),
            //     //   onPressed: () {
            //     //     Navigator.pop(context);
            //     //   },
            //     // ),
            //     TextButton(
            //       child: const Text('Rejected'),
            //       onPressed: () async {
            //         if (Form.of(context).validate()) {
            //           await value.addOnfirebase(
            //               widget.data['userid'],
            //               widget.data['username'],
            //               widget.data['employename'],
            //               widget.data['userimageurl'],
            //               widget.data['employimageurl']);

            //           Get.snackbar(
            //               "${widget.data['username']}", "This Work is Rejected",
            //               backgroundColor: Color.fromARGB(244, 5, 85, 79));
            //           value.comments.clear();

            //           Navigator.pop(context);
            //         }

            //         // await value.addOnfirebase(
            //         //     widget.data['userid'],
            //         //     widget.data['username'],
            //         //     widget.data['employename'],
            //         //     widget.data['userimageurl'],
            //         //     widget.data['employimageurl']);

            //         // Get.snackbar(
            //         //     "${widget.data['username']}", "This Work is Rejected",
            //         //     backgroundColor: Color.fromARGB(244, 5, 85, 79));
            //         // value.comments.clear();

            //         // Navigator.pop(context);
            //       },
            //     )
            //   ],
            // );
          });
        },
      );
    }

    var mediaqury = MediaQuery.of(context).size;
    bool isstartClicked = false;

    bool isstart = false;
    bool isendClicked = false;
    bool colorchange = false;
    dynamic colorr;
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
          return Consumer2<EmployStatusLevel, WorkNotCompleted>(
              builder: (context, value, notcompletValue, child) {
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
                  Row(children: [
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset(
                          'asset/animation/infographic_circle_01-01.png'),
                    ),
                  ]),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      ' Work\nStatus',
                      style:
                          TextStyle(fontSize: 33, fontWeight: FontWeight.w900),
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
                            padding: EdgeInsets.only(
                                right: 22, top: mediaqury.height * .14),
                            child: SizedBox(
                                height: 45,
                                width: 170,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // setState(() {
                                    //   isstartClicked = !isstartClicked;
                                    //   colorchange = !colorchange;

                                    //   print("isstartClicked: $isstartClicked");
                                    //   print("colorchange: $colorchange");
                                    // });
                                    await Provider.of<EmployStatusLevel>(
                                            context,
                                            listen: false)
                                        .startchagengdata();
                                    await Provider.of<EmployStatusLevel>(
                                            context,
                                            listen: false)
                                        .addData(
                                      widget.data['userid'],
                                      widget.data['employid'],
                                    );

                                    // if (isstartClicked == true) {
                                    //   print(
                                    //       "Button clicked with isstartClicked == true");

                                    //   await Provider.of<EmployStatusLevel>(
                                    //           context,
                                    //           listen: false)
                                    //       .addData(widget.data['userid'],
                                    //           isendClicked);
                                    //   //  Get.snackbar("Work starting " , "");
                                    // } else {
                                    //   isstart = false;

                                    //   await Provider.of<EmployStatusLevel>(
                                    //           context,
                                    //           listen: false)
                                    //       .addData(widget.data['userid'],
                                    //           isendClicked);
                                    //   //  Get.snackbar("Work Not starting " , "");
                                    // }
                                  },
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(5),
                                    shadowColor:
                                        MaterialStateProperty.all(Colors.grey),
                                    backgroundColor: MaterialStateProperty.all(
                                      value.onstartChanged == true
                                          ? const Color.fromARGB(255, 6, 93, 4)
                                          : const Color.fromARGB(
                                              255, 240, 17, 80),
                                    ),
                                  ),
                                  child: Text(
                                    value.detailssss == true
                                        ? "🏃🏼...Working"
                                        : "Start",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                )
                                //  ElevatedButton(
                                //     style: ButtonStyle(
                                //         elevation: MaterialStatePropertyAll(5),
                                //         shadowColor:
                                //             MaterialStatePropertyAll(Colors.grey),
                                //         backgroundColor: MaterialStatePropertyAll(
                                //             isstartClicked
                                //                 ? Color.fromARGB(255, 240, 17, 80)
                                //                 : Color.fromARGB(255, 6, 93, 4))),
                                //     onPressed: ()async {
                                //       setState(
                                //           () => isstartClicked = !isstartClicked);
                                //       if (isstartClicked == true) {
                                //        await Provider.of<EmployStatusLevel>(context,
                                //                 listen: false)
                                //             .addData(widget.data['userid'],
                                //                 isstartClicked, isendClicked);
                                //       }
                                //     },
                                //     child: Text(
                                //       isstartClicked ? "Start" : "Working",
                                //       style: TextStyle(fontSize: 20),
                                //     ))
                                ),
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
                                  'asset/animation/animation_lmge13wo (1).json'),
                              // color: Colors.amberAccent,
                            ),
                          ),
                          hight10,
                          GestureDetector(
                            onTap: () async {
                              await showDialogfuntion(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 50),
                              child: Text(
                                'Works\nNot Completed',
                                textAlign: TextAlign.center,
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
                                    style: ButtonStyle(
                                      elevation:
                                          const MaterialStatePropertyAll(5),
                                      shadowColor:
                                          const MaterialStatePropertyAll(
                                              Colors.grey),
                                      backgroundColor: MaterialStatePropertyAll(
                                        value.onendChanged == true
                                            ? const Color.fromARGB(
                                                255, 6, 93, 4)
                                            : const Color.fromARGB(
                                                255, 65, 169, 248),
                                      ),
                                    ),
                                    onPressed: () async {
                                      await Provider.of<EmployStatusLevel>(
                                              context,
                                              listen: false)
                                          .endchagengdata();
                                      await Provider.of<EmployStatusLevel>(
                                              context,
                                              listen: false)
                                          .addData(
                                        widget.data['userid'],
                                        widget.data['employid'],
                                      );

                                      await Future.delayed(
                                          const Duration(seconds: 2));

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PaymentRequest(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      value.onendChanged == "true"
                                          ? "Happy "
                                          : "Happy End😎",
                                      style: const TextStyle(fontSize: 20),
                                    ))),
                          ),
                        ]),
                  )
                ],
              ),
            );
          });
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
                        'Name : ${widget.data['username']}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      hight5,
                      Text(
                        'Address : ${widget.data['useraddress']}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      hight5,
                      Text(
                        'Work Date : ${widget.data['workdate']}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () async {
                        await value
                            .getreceiverId(widget.data['userid'].toString());
                        print(
                            "${widget.data['userid'].toString()}eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeereeeeeeeeeeeeeeeeeeeeeeeeeeeefasdfsadf");
                        print(widget.data['userid'].toString());
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EmployChatPage(
                              receiverUserEmail:
                                  auth.currentUser!.email.toString(),
                              receiverUserId: widget.data['userid'].toString()),
                        ));
                      },
                      icon: const Icon(
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
                              NetworkImage("${widget.data['userimageurl']}"),
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

  void notCompleFrom(WorkNotCompleted notcompletValue) {
    _showDialog(BuildContext context) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(16.0),
            content: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: notcompletValue.comments,
                    autofocus: true,
                    decoration: const InputDecoration(
                      labelText: 'Enter your Comment here',
                      hintText: 'Why Not completed ',
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('OPEN'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }
  }
}
