// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/hiddenDrawer.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';

class WorkConformationpage extends StatelessWidget {
  const WorkConformationpage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime seletetimedate = DateTime.now();
    // ignore: unused_element
    void selecttimeand() {
      showDatePicker(
              textDirection: TextDirection.rtl,
              context: context,
              initialDate: seletetimedate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2025))
          .then((value) {
        seletetimedate = value!;
      });
    }

    var mediaQury = MediaQuery.of(context);
    return Scaffold(
        drawer: const NewDrawer(),
        appBar: AppBar(
          title: const Center(child: Text('Conformation')),
          actions: const [Icon(Icons.dashboard_customize_rounded)],
          leading: IconButton(
              onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HiddenDrawer();
              },)) ;},
              icon: const Icon(Icons.arrow_circle_left_sharp)),
        ),
        body: SafeArea(
            child: ListView(
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
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            radius: 35,
                          ),
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
                const EmployesWorkConformation(hinttext: 'Name'),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Address",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                const EmployesWorkConformation(
                  hinttext: 'Address',
                  line: 160,
                ),
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
                          //       padding: const EdgeInsets.only(left: 20, top: 10),
                          //       child: SizedBox(
                          //         width: 180,
                          //         child: ElevatedButton(
                          //             onPressed: () {
                          //               selecttimeand();
                          //             },
                          //             child: const Text(
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
                                        '${seletetimedate.day}/${seletetimedate.month}/${seletetimedate.year}',
                                        style: const TextStyle(fontSize: 22),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 60,
                                  width: 150,
                                  child: Card(
                                    child: Center(
                                      child: Text(
                                        '${seletetimedate.hour} : ${seletetimedate.minute}',
                                        style: const TextStyle(fontSize: 22),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                hight10,
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Payment",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Card(
                      shadowColor: Colors.teal,
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Price',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                hight30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 180,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange[600])),
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
                        onPressed: () {},
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
        )));
  }
}
