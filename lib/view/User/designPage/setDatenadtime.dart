// ignore_for_file: file_names, prefer_typing_uninitialized_variables, unused_local_variable, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/controller/user/allwork/selectwork.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/User/designPage/employeesDetailsPage.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ScheduleTimeAndDate extends StatefulWidget {
  const ScheduleTimeAndDate({super.key});

  @override
  State<ScheduleTimeAndDate> createState() => _ScheduleTimeAndDateState();
  // bool ischecked = false;
}

class _ScheduleTimeAndDateState extends State<ScheduleTimeAndDate> {
  bool valuefirst = false;
  bool valuesecond = false;
  @override
  Widget build(BuildContext context) {
    DateTime dateTimes = DateTime.now();
    // dynamic datee = dateTimes;
    Future<void> selecttimeand() async {
      await showDatePicker(
              textDirection: TextDirection.rtl,
              context: context,
              initialDate: dateTimes,
              firstDate: DateTime(2000),
              lastDate: DateTime(2030))
          .then((value) {
        setState(() {
          dateTimes = value!;
        });
      });
    }

    // ignore: no_leading_underscores_for_local_identifiers
    var _mediaQury = MediaQuery.of(context).size;
    var size;
    return Consumer<SelectWorkPage>(builder: (context, value, child) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          body: SafeArea(
              child: Column(
            // mainAxisAlignment: MainAxisAlignment.,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hight5,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Select ',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  

                  width: double.infinity,
                  child: Card(
                    color: Colors.grey[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        hight10,
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
                        hight10,
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 3),
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      await selecttimeand();
                                      value.addDate(
                                          '${dateTimes.day.toString()}/ ${dateTimes.month}/${dateTimes.year}',
                                          '${dateTimes.day.toString()}');
                                      // value.addDate(
                                      //     '${dateTimes.day.toString()}/ ${dateTimes.month}/${dateTimes.year}',);
                                      //DateTime dateTimes = DateTime.now();
                                    },
                                    child: const Text(
                                      'Select Date',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(
                                height: 50,
                                width: 150,
                                child: Card(
                                  child: Center(
                                    child: Text(
                                      value.date,
                                      style: const TextStyle(fontSize: 22),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        hight10,
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  // height: _mediaQury.size.height * .3,
                  width: double.infinity,
                  // color: Colors.grey,
                  child: Card(
                    color: Colors.amber,
                    child: Column(
                      children: [
                        hight10,
                        WorkUserInformation(
                          mediaquery: _mediaQury.height * .10,
                          validatormessage: 'Enter Address',
                          keybord: TextInputType.streetAddress,
                          contros: value.address,
                          hinttext: 'Address',
                          line: 1,
                        ),
                        WorkUserInformation(
                          line: 1,
                          validatormessage: "Enter phone number",
                          keybord: TextInputType.phone,
                          contros: value.phone,
                          hinttext: 'Phone Number',
                        ),
                        const DistrictSelectionWidget()
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  'Employees',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: SizedBox(
                    child:
                        //  ListView.builder(
                        //   itemBuilder: (context, index) {
                        //     return GestureDetector(
                        //         onTap: () {
                        //           Navigator.push(context, MaterialPageRoute(
                        //             builder: (context) {
                        //               return const EmployeesDetailsPage();
                        //             },
                        //           ));
                        //         },
                        //         child: const WorkEmployeesAvailable());
                        //   },
                        //   itemCount: 10,
                        // ),

                        StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Employes')
                      .where('district', isEqualTo: value.district)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: const CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(
                          child: Lottie.asset(
                              'asset/animation/Animation - 1695375830883.json'));
                    }
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final document = snapshot.data!.docs[index];
                            final data =
                                document.data() as Map<String, dynamic>;
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return EmployeesDetailsPage(
                                        data: data,
                                      );
                                    },
                                  ));
                                },
                                child: EmployeeList(data: data));
                          },
                        );
                      } else {
                        return const Text('error');
                      }
                    } else {
                      return const Text('error');
                    }
                  },
                )),
              )
            ],
          )));
    });
  }
}

class EmployeeList extends StatelessWidget {
  const EmployeeList({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: SizedBox(
        height: 60,
        // color: Colors.amber,
        width: double.infinity,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.blue[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Width10,
                Container(
                  clipBehavior: Clip.hardEdge,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(3))),
                  child: Image.network(
                    data['imageUrl'],
                    fit: BoxFit.cover,
                  ),
                ),
                Width30,

                SizedBox(
                  width: 120,
                  child: Text(
                    data['fullname'],
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                ),
                // Text(
                //   'Date',
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                // ),
                const Spacer(),
                const Text(
                  'Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromARGB(255, 43, 100, 147)),
                ),
                Width10,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WorkUserInformation extends StatelessWidget {
  const WorkUserInformation({
    super.key,
    required this.hinttext,
    this.line,
    this.widths,
    this.contros,
    this.validatormessage,
    this.keybord,
    this.mediaquery,
  });
  final hinttext;
  final line;
  final widths;
  final contros;
  final validatormessage;
  final keybord;
  final mediaquery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: SizedBox(
        width: widths ?? double.infinity,
        height: mediaquery,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          shadowColor: Colors.black,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return validatormessage;
                }
                return null;
              },
              controller: contros,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: hinttext),
              maxLines: line ?? 1,
            ),
          ),
        ),
      ),
    );
  }
}
