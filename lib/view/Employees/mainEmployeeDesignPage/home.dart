// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/VIEW/Employees/pendingWork/PandingWorkmodel.dart';
import 'package:homesefty/controller/employes/chat/chat.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/ratingPage.dart';
import 'package:homesefty/view/Employees/modelPage/employeRatingModelPage.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/view/Employees/profilePage/profilepagedetails.dart';
import 'package:homesefty/view/User/userpersonaletailspage/userpersonaldetails.dart';
import 'package:provider/provider.dart';

class EmployesHome extends StatefulWidget {
  const EmployesHome({super.key});

  @override
  State<EmployesHome> createState() => _EmployesHomeState();
}

class _EmployesHomeState extends State<EmployesHome> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    bool ischange = false;
    // ignore: no_leading_underscores_for_local_identifiers
    var _mediaqury = MediaQuery.of(context);
    return Consumer<EmployeChating>(builder: (context, value, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: const Color.fromARGB(255, 22, 58, 61),
        drawer: const NewDrawer(),
        // appBar: AppBar(
        //   backgroundColor: Color.fromARGB(255, 9, 88, 97),
        //   title: const Center(child: Text('Home')),
        //   actions: [const Icon(Icons.dashboard_customize_rounded)],
        //   leading: IconButton(
        //       onPressed: () {
        //         HiddenDrawer();
        //       },
        //       icon: const Icon(Icons.arrow_circle_left_sharp)),
        // ),
        body: SafeArea(
            child: Column(
          children: [
            hight10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(205, 3, 110, 120),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Text(
                        'Active',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      const Spacer(),
                      Switch(
                          value: ischange,
                          onChanged: (value) {
                            setState(() {
                              ischange = value;
                            });
                          })
                    ],
                  ),
                ),
                height: _mediaqury.size.height * .08,
                width: double.infinity,
              ),
            ),
            hight10,
            // Container(
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) {
            //       return const RatingEmployessPage();
            //     },
            //     itemCount: 10,
            //   ),
            // ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rating',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color.fromARGB(255, 87, 89, 90)),
                ),
              ),
            ),

            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(8, 18, 255, 69),
                  borderRadius: BorderRadius.all(Radius.circular(1))),
              height: _mediaqury.size.height * .3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                      width: _mediaqury.size.width * 1,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const RatingPag();
                              },
                            ));
                          },
                          child: const RatingEmployessPage()));
                },
                itemCount: 10,
                shrinkWrap: false,
              ),
              // color: const Color.fromARGB(71, 21, 236, 129),
            ),
            hight10,
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Work Pending',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color.fromARGB(255, 87, 89, 90)),
                ),
              ),
            ),

            Expanded(
              child: SizedBox(
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('SelectWork')
                        .doc("selct")
                        .collection('Electronics')
                        .where('employid', isEqualTo: auth.currentUser?.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData) {
                          print(snapshot.data!.docs.length);
                          return Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(110, 3, 80, 80),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('conformwork')
                                    .where("employid",
                                        isEqualTo: auth.currentUser?.uid)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.active) {
                                    if (snapshot.hasData) {
                                      return ListView.builder(
                                        itemBuilder: (context, index) {
                                          final data =
                                              snapshot.data!.docs[index];
                                          final datas = data.data()
                                              as Map<String, dynamic>;
                                          // value.getreceiverId(data['userid']);

                                          return Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: PandingworkStatusPPage(
                                                data: datas),
                                          );
                                        },
                                        itemCount: snapshot.data!.docs.length,
                                        shrinkWrap: false,
                                      );
                                    } else {
                                      return const Text('error');
                                    }
                                  }
                                  return Text('Error');
                                },
                              ),
                            ),
                          );
                          // ListView.builder(
                          //   itemCount: snapshot.data!.docs.length,
                          //   itemBuilder: (context, index) {
                          //     final document = snapshot.data!.docs[index];
                          //     final data =
                          //         document.data() as Map<String, dynamic>;
                          //     return Container(
                          //       height: 50,
                          //       width: double.infinity,
                          //       color: Colors.black,
                          //     );
                          //   },
                          // );
                        } else {
                          return Text('data');
                        }
                      } else {
                        return Text("eror");
                      }
                    }),
              ),
            ),
            // Expanded(
            //   child: Container(
            //     decoration: const BoxDecoration(
            //         color: Color.fromARGB(110, 3, 80, 80),
            //         borderRadius:
            //             BorderRadius.vertical(top: Radius.circular(20))),
            //     child: ListView.builder(
            //       itemBuilder: (context, index) {
            //         return const Padding(
            //           padding: EdgeInsets.only(top: 10),
            //           child: PandingworkStatusPPage(),
            //         );
            //       },
            //       itemCount: 10,
            //       shrinkWrap: false,
            //     ),
            //   ),SSSSSSS
            // ),
          ],
        )),
      );
    });
  }
}

class NewDrawer extends StatelessWidget {
  const NewDrawer({
    super.key,
    this.Colorss,
  });
  final Colorss;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 3, 55, 64),
      child: Column(children: [
        hight30,
        hight30,
        hight30,
        // Container(
        //   decoration: BoxDecoration(
        //       border: Border.all(
        //         width: 6,
        //         color: Colors.white,
        //       ),
        //       color: const Color.fromARGB(255, 5, 112, 92),
        //       borderRadius: BorderRadius.circular(20)),
        //   width: 160,
        //   height: 160,
        // ),
        hight20,
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return EmployeesProfilePage();
              },
            ));
          },
          leading: Icon(
            Icons.person,
            size: 35,
            color: Colors.white,
          ),
          title: Text(
            'Personal Details',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.room_preferences_outlined,
            size: 35,
            color: Colors.white,
          ),
          title: Text(
            'Terms and Conditions',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.info,
            size: 35,
            color: Colors.white,
          ),
          title: Text(
            'About',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.logout,
            size: 35,
            color: Colors.white,
          ),
          title: Text(
            'Log Out',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
