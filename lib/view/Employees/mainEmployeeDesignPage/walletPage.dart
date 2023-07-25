import 'package:flutter/material.dart';
import 'package:homesefty/core/Colors%20,%20Width%20,%20Hight/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _mediaqury = MediaQuery.of(context);
    return Scaffold(
      drawer: NewDrawer(),
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
                  child: Image.asset('asset/animation/6081546-01-01.png'),
                  // color: Colors.amber,
                  width: _mediaqury.size.width * .85,
                  height: _mediaqury.size.height * .29,
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
                child: ListView.builder(
                  itemCount: 11,
                  itemBuilder: (context, index) {
                    return SuccessfulPaymentListModel(
                      indexss: index * 26 - 1,
                    );
                  },
                ),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 10, 67, 58),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                // color: Colors.amberAccent,
                width: _mediaqury.size.width,
              ),
            )
          ],
        ),
      )),
    );
  }
}
