import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homesefty/core/Colors%20,%20Width%20,%20Hight/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';

class UserPaymentRequestListModel extends StatelessWidget {
  const UserPaymentRequestListModel({super.key, this.indexss});
  final indexss;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return UserPaymentPage();
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 80,
          // color: Colors.amber,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              shadowColor: Colors.teal,
              elevation: 5,
              color: const Color.fromARGB(255, 233, 230, 230),
              child: Row(
                children: [
                  Width20,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // color: Colors.amber,
                        width: 150,
                        child: const Text(
                          'User Name',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Container(
                        // color: Colors.amber,
                        width: 150,
                        child: const Text(
                          'Work',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    // color: Colors.amber,
                    width: 70,
                    child: Text(
                      '+₹ ${indexss}',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 10, 102, 13)),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class UserPaymentPage extends StatefulWidget {
  const UserPaymentPage({super.key});

  @override
  State<UserPaymentPage> createState() => _UserPaymentPageState();
}

class _UserPaymentPageState extends State<UserPaymentPage> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    rating() async {
      showBottomSheet(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(248, 207, 207, 213),
                          ),
                          height: 60,
                          width: double.infinity,
                          // color: Color.fromARGB(250, 244, 26, 11),
                        ),
                        hight10,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                              width: double.infinity,
                              height: 63,
                              child: const EmployesWorkConformation(
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      backgroundColor: Color.fromARGB(255, 255, 234, 170),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          hight30,
          Container(
            width: 150,
            height: 150,
            child: const CircleAvatar(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
              ),
              radius: 90,
            ),
          ),
          hight30,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 60,
              // color: Colors.amber,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: const Color.fromARGB(255, 248, 248, 248),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Employ Name',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 60,
              // color: Colors.amber,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: const Color.fromARGB(255, 248, 248, 248),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Work',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 130,
              // color: Colors.amber,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: const Color.fromARGB(255, 248, 248, 248),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Description',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 60,
              // color: Colors.amber,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: const Color.fromARGB(255, 248, 248, 248),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Amount',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
            ),
          ),
          hight30,
          SizedBox(
            width: 180,
            height: 50,
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 4, 91, 8))),
                onPressed: () async {
                  await Paymentafter();
                  await Future.delayed(Duration(seconds: 2));

                  // await rating();
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
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
                            content: TextFormField(
                                decoration:
                                    InputDecoration(hintText: 'rating')),
                          ));
                },
                child: const Text('Pay',
                    style: TextStyle(
                      fontSize: 20,
                    ))),
          )
        ],
      )),
    );
  }
}