import 'package:flutter/material.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/User/uesrtextformfield/paymentrequest.dart';

class UserPaymentRequestPage extends StatelessWidget {
  const UserPaymentRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'payment Requst',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              // color: Colors.amber,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return UserPaymentRequestListModel(
                    indexss: index,
                  );
                },
                itemCount: 10,
              ),
            ),
          )
        ],
      )),
    );
  }
}
