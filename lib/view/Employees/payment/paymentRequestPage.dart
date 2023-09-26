// ignore_for_file: file_names, unused_element, unused_local_variable, use_build_context_synchronously, duplicate_ignore

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:homesefty/controller/employes/payment%20request/employPayRequest.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/hiddenDrawer.dart';
import 'package:provider/provider.dart';

class PaymentRequestpage extends StatelessWidget {
  const PaymentRequestpage({super.key, required this.datas});
  final Map<String, dynamic> datas;

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
    return Consumer<EmployPayRequest>(builder: (context, value, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Center(child: Text('Payment')),
          actions: const [Icon(Icons.dashboard_customize_rounded)],
          leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const HiddenDrawer();
                  },
                ));
              },
              icon: const Icon(Icons.arrow_circle_left_sharp)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
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
                  DetailsProfilepage(
                    hinttext: datas['username'],
                    // contros: datas['username'],
                    keybord: TextInputType.name,
                  ),
                  DetailsProfilepage(
                    hinttext: 'Work',
                    contros: value.works,
                    keybord: TextInputType.name,
                  ),
                  DetailsProfilepage(
                      hinttext: 'Descrption',
                      contros: value.decorations,
                      keybord: TextInputType.text,
                      line: 5),
                  DetailsProfilepage(
                    hinttext: 'Payment',
                    contros: value.payments,
                    keybord: TextInputType.number,
                  ),
                  hight30,
                  SizedBox(
                    width: 280,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.greenAccent[700])),
                      onPressed: () async {
                     await   value.adddata(
                            datas['employid'],
                            datas['employimageurl']?? "https://www.biiainsurance.com/wp-content/uploads/2015/05/no-image.jpg",
                            datas['employename'],
                            datas['userid'],
                            datas['username'],
                            datas['userimageurl']?? "https://www.biiainsurance.com/wp-content/uploads/2015/05/no-image.jpg",);

                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const HiddenDrawer();
                          },
                        ));
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: const Color.fromARGB(255, 193, 189, 189)),
              // height: mediaqury.size.height * 0.7,
              // width: double.infinity,
            ),
          ),
        ),
      );
    });
  }
}
