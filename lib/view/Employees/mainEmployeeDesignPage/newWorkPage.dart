// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/workConformationpage.dart';
import 'package:homesefty/view/Employees/modelPage/newWorks.dart';

class NewWorkPage extends StatefulWidget {
  const NewWorkPage({super.key});

  @override
  State<NewWorkPage> createState() => _NewWorkPageState();
}

class _NewWorkPageState extends State<NewWorkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NewDrawer(),
      // appBar: AppBar(
      //   title: const Center(child: Text('New Works')),
      //   actions: [const Icon(Icons.dashboard_customize_rounded)],
      //   leading: IconButton(
      //       onPressed: () {}, icon: const Icon(Icons.arrow_circle_left_sharp)),
      // ),
      body: SafeArea(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorkConformationpage(),
                  )),
              child: const NewworkModel());
        },
        itemCount: 10,
      )),
    );
  }
}
