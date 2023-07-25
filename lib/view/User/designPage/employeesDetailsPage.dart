// import 'dart:js';

import 'package:flutter/material.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:homesefty/core/Colors%20,%20Width%20,%20Hight/colors&size.dart';

class EmployeesDetailsPage extends StatelessWidget {
  const EmployeesDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _mediaqury = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees info'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                hight10,
                Center(
                  child: SizedBox(
                    height: _mediaqury.size.height * .20,
                    width: _mediaqury.size.height * .3,
                    // color: Colors.amber,
                    child: const CircleAvatar(
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.white70,
                      ),
                    ),
                  ),
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Add image'))),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Location :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Phone :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Sex :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Age :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Center(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    width: _mediaqury.size.width * .9,
                    height: _mediaqury.size.height * .3,
                    // color: Colors.amber,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        //set border radius more than 50% of height and width to make circle
                      ),
                      color: Color.fromARGB(131, 185, 212, 247),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Profession :-',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                hight10,
                Center(
                    child: SizedBox(
                  width: _mediaqury.size.width * .5,
                  // height: _mediaqury.size.height * .1,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              const Color.fromARGB(255, 3, 67, 120))),
                      onPressed: () {},
                      child: const Text(
                        'Conform',
                        style: TextStyle(fontSize: 25),
                      )),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
