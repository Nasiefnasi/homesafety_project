import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:homesefty/core/Colors%20,%20Width%20,%20Hight/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';

class PaymentRequest extends StatelessWidget {
  const PaymentRequest({super.key});

  @override
  Widget build(BuildContext context) {
    message() async {
      await CoolAlert.show(
          context: context,
          type: CoolAlertType.loading,
          autoCloseDuration: const Duration(seconds: 2));
      CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: 'Transaction completed successfully!',
        autoCloseDuration: const Duration(seconds: 2),
      );
    }

    var _mediaqury = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(child: Text('Home')),
        actions: [const Icon(Icons.dashboard_customize_rounded)],
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_circle_left_sharp)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
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
                const DetailsProfilepage(hinttext: 'User Name'),
                const DetailsProfilepage(hinttext: 'Work'),
                const DetailsProfilepage(hinttext: 'Descrption', line: 5),
                const DetailsProfilepage(hinttext: 'hinttext'),
                hight30,
                SizedBox(
                  width: 280,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.greenAccent[700])),
                    onPressed: () {
                      message();
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
            height: _mediaqury.size.height * 0.7,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
