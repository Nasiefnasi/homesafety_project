// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    var _mediaqury = MediaQuery.of(context);
    return Scaffold(
      drawer: const NewDrawer(),
      body: SafeArea(
          child: SizedBox(
        width: _mediaqury.size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            hight30,
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Total Balance",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  width: _mediaqury.size.width * .85,
                  height: _mediaqury.size.height * .29,
                  child: Image.asset('asset/animation/6081546-01-01.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 100, left: 190),
                  child: Text(
                    '₹ 12000',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Successful Payment ",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ),
            hight20,
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 10, 67, 58),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                // color: Colors.amberAccent,
                width: _mediaqury.size.width,
                child: ListView.builder(
                  itemCount: 11,
                  itemBuilder: (context, index) {
                    return SuccessfulPaymentListModel(
                      indexss: index * 26 - 1,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
