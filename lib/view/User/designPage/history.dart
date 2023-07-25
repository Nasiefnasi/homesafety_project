import 'package:flutter/material.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';

class UserHistoryPage extends StatelessWidget {
  const UserHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('History'),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return SuccessfulPaymentListModel(
            indexss: index + 51 * 2,
          );
        },
        itemCount: 10,
      )),
    );
  }
}
