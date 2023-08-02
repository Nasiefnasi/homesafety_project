
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/hiddenDrawer.dart';

class PaymentRequest extends StatelessWidget {
  const PaymentRequest({super.key});

  @override
  Widget build(BuildContext context) {
    message() async {
      await CoolAlert.show(
          context: context,
          type: CoolAlertType.loading,
          autoCloseDuration: const Duration(seconds: 2));
      // ignore: use_build_context_synchronously
      CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: 'Transaction completed successfully!',
        autoCloseDuration: const Duration(seconds: 2),
      );
    }

    var mediaqury = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(child: Text('payment')),
        actions: const [Icon(Icons.dashboard_customize_rounded)],
        leading: IconButton(
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HiddenDrawer();
              },)) ;}, icon: const Icon(Icons.arrow_circle_left_sharp)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            // ignore: sort_child_properties_last
            child: Column(
              children: [
                hight20,
                const Text(
                  'Payment Request',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(115, 46, 45, 45)),
                ),
                hight10,
                // const DetailsProfilepage(hinttext: 'User Name'),
                // const DetailsProfilepage(hinttext: 'Work'),
                // const DetailsProfilepage(hinttext: 'Descrption', line: 5),888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
                // const DetailsProfilepage(hinttext: 'hinttext'),
                hight30,
                SizedBox(
                  width: 280,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.greenAccent[700])),
                    onPressed: () async {
                      message();
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return HiddenDrawer();
                      },));
                      // Map<String, dynamic> data = {
                      //   'name': 'ghhjjk',
                      //   'age': 34,
                      //   'number': 994,
                      //   'ae': 349
                      // };
                      // await FirebaseFirestore.instance
                      //     .collection('product')
                      //     .doc('12343')
                      //     .set(data);
                    },
                    child: const Text(
                      'Payment Request',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 193, 189, 189)),
            height: mediaqury.size.height * 0.7,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
