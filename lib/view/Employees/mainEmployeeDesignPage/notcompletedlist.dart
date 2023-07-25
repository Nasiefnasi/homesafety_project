import 'package:flutter/material.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';

class NotCompletedlist extends StatelessWidget {
  const NotCompletedlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NewDrawer(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return const NotCompletedListModel();
        },
        itemCount: 10,
      )),
    );
  }
}
