import 'package:flutter/material.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';
import 'package:homesefty/view/Employees/modelPage/employeRatingModelPage.dart';

class RatingPag extends StatelessWidget {
  const RatingPag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NewDrawer(),
      body: SafeArea(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return RatingEmployessPage();
        },
        itemCount: 10,
      )),
    );
  }
}
