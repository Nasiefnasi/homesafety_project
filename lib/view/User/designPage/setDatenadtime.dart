import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:homesefty/core/Colors%20,%20Width%20,%20Hight/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/User/designPage/employeesDetailsPage.dart';

class ScheduleTimeAndDate extends StatefulWidget {
  ScheduleTimeAndDate({super.key});

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
              lastDate: DateTime(2025))
          .then((value) {
        setState(() {
          dateTimes = value!;
        });
      });
    }

    var _mediaQury = MediaQuery.of(context);
    return Scaffold(
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
                'Select the date',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // color: Colors.amber,
                height: _mediaQury.size.height * .24,
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
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 3),
                            child: SizedBox(
                              width: 180,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await selecttimeand();
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
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              height: 60,
                              width: 180,
                              child: Card(
                                child: Center(
                                  child: Text(
                                    '${dateTimes.day.toString()}/ ${dateTimes.month}/${dateTimes.year}',
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
                              width: 140,
                              child: Card(
                                child: Center(
                                  child: Text(
                                    '${dateTimes.hour} : ${dateTimes.minute}',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: _mediaQury.size.height * .3,
                width: double.infinity,
                // color: Colors.grey,
                child: Card(
                  color: Colors.purple[700],
                  child: Column(
                    children: [
                      hight10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: const Card(),
                          // color: Color.fromARGB(242, 247, 243, 243),
                          width: _mediaQury.size.width * .9,
                          height: _mediaQury.size.height * .1,
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              'Current location',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          Checkbox(
                            overlayColor:
                                const MaterialStatePropertyAll(Colors.white60),
                            checkColor: Colors.greenAccent,
                            activeColor: Colors.teal[800],
                            value: this.valuefirst,
                            onChanged: (bool? value) {
                              setState(() {
                                this.valuefirst = value!;
                              });
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 5,
                            ),
                            child: Text(
                              'Current location',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          Checkbox(
                            overlayColor:
                                const MaterialStatePropertyAll(Colors.white60),
                            checkColor: Colors.greenAccent,
                            activeColor: Colors.teal[800],
                            value: this.valuesecond,
                            onChanged: (bool? value) {
                              setState(() {
                                this.valuesecond = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      const EmployesWorkConformation(hinttext: 'Phone Number')
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
              child: Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return EmployeesDetailsPage();
                            },
                          ));
                        },
                        child: const WorkEmployeesAvailable());
                  },
                  itemCount: 10,
                ),
              ),
            )
          ],
        )));
  }
}
