// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, use_build_context_synchronously, unused_local_variable, sort_child_properties_last, unused_element

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:homesefty/VIEW/Employees/profilePage/profilepagedetails.dart';
import 'package:homesefty/VIEW/User/paymentpage/payment.dart';

import 'package:homesefty/controller/user/feedback/feedback.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

// import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
//
class UserPaymentRequestListModels extends StatelessWidget {
  const UserPaymentRequestListModels({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    var mediaqury = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 80,
        // color: Colors.amber,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            shadowColor: Colors.teal,
            elevation: 5,
            color: const Color.fromARGB(255, 233, 230, 230),
            child: Row(
              children: [
                Width20,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      // color: Colors.amber,
                      width: 150,
                      child: Text(
                        data['employName'],
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        // color: Colors.amber,
                        width: 150,
                        child: Text(
                          data['work'],
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return UserPaymentPage(datas: data);
                        },
                      ));
                    },
                    child: Text(
                      // ignore: unnecessary_brace_in_string_interps
                      '+₹ ${data['payment']}',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 243, 246, 243)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                )
              ],
            )),
      ),
    );
  }
}

class UserPaymentPage extends StatefulWidget {
  const UserPaymentPage({super.key, required this.datas});
  final Map<String, dynamic> datas;

  @override
  State<UserPaymentPage> createState() => _UserPaymentPageState();
}

class _UserPaymentPageState extends State<UserPaymentPage> {
  final _formKey = GlobalKey<FormState>();

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Success Payment :${response.paymentId} ", timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR HERE :${response.message} ", timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL WALLET IS  :${response.walletName} ",
        timeInSecForIosWeb: 4);
  }

  makePayment() async {
    var options = {
      'key': 'rzp_test_5GZdL4kxKRGHek',
      'amount': 200,
      'name': 'Nasief',
      'description': 'enter the work',
      'prefill': {'contact': '+917561000296', 'email': 'nasinasief@gmail.com'}
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Razorpay? _razorpay;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  double rating = 0;
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    rating() async {
      showBottomSheet(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 180,
                  width: double.infinity,
                  // color: Colors.amber,
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(249, 245, 240, 239),
                      ),
                      height: 180,
                      width: double.infinity,
                      // color: Color.fromARGB(250, 244, 26, 11),
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(248, 207, 207, 213),
                          ),
                          height: 60,
                          width: double.infinity,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(children: [
                              Text(
                                'Data',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontSize: 20),
                              ),
                              Spacer(),
                              CircleAvatar(
                                radius: 25,
                              )
                            ]),
                          ),
                          // color: Color.fromARGB(250, 244, 26, 11),
                        ),
                        hight10,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            width: double.infinity,
                            height: 36,
                            child: RatingBar.builder(
                              itemSize: 25,
                              minRating: 0,
                              glowColor: Colors.black,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) => setState(() {
                                this.rating = rating;
                              }),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                              width: double.infinity,
                              height: 63,
                              child: EmployesWorkConformation(
                                  hinttext: "hinttext")),
                        )
                      ],
                    ),
                  ]),
                ),
              )
            ],
          );
        },
      );
    }

    Paymentafter() async {
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

    var mediaqury = MediaQuery.of(context).size;
    return Consumer<Rating>(builder: (context, value, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
        ),
        body: SafeArea(
            child: ListView(
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: mediaqury.height * .3,
                        padding: const EdgeInsets.all(8), // Border width
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 3, 74, 8),
                            borderRadius: BorderRadius.circular(40)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(80), // Image radius
                            child: Image.network(widget.datas['employImageUrl'],
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                hight10,
                SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 4, 91, 8))),
                        onPressed: () async {
                          // await makePayment();
                          await RozzerPayResponse().makePayment(
                            widget.datas['payment'],
                            widget.datas['employName'],
                            widget.datas['employid'],
                            widget.datas['username'],
                             widget.datas['userImageUrl'],
                          );

                          // await Paymentafter();
                          await Future.delayed(const Duration(seconds: 2));

                          // await rating();
                          await showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text('Feedback'),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Form(
                                      key:
                                          _formKey, // Ensure _formKey is defined earlier in your code
                                      child: TextFormField(
                                        controller: value.feedbackss,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please enter the Feedback";
                                          } else if (value.length < 5) {
                                            return "Enter at least 5 characters";
                                          }
                                          return null; // Return null for no validation error
                                        },
                                        decoration: const InputDecoration(
                                          hintText: 'Feedback',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        height:
                                            20), // Adjust the spacing as needed
                                    TextButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          // Perform your action here when the form is valid
                                          await value.addratingfeedback(
                                            widget.datas['userid'],
                                            widget.datas['employid'],
                                            widget.datas['employImageUrl'],
                                            widget.datas['userImageUrl'],
                                            widget.datas['username'],
                                          );
                                          value.feedbackss.clear();

                                          // Close the AlertDialog
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      child: const Text("Submit"),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          
                          );
                        },
                        child: Text('Pay  ${widget.datas['payment']}',
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500))),
                  ),
                ),
                ShowDetailWidget(text: widget.datas['employName']),
                ShowDetailWidget(text: widget.datas['work']),
                ShowDetailWidget(
                    text: widget.datas['description'], cusmeheight: 150),
                ShowDetailWidget(text: widget.datas['payment']),
                hight10,
              ],
            ),
          ],
        )),
      );
    });
  }
}


