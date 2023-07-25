import 'package:flutter/material.dart';
import 'package:homesefty/core/Colors%20,%20Width%20,%20Hight/colors&size.dart';

class NewworkModel extends StatelessWidget {
  const NewworkModel({super.key});

  @override
  Widget build(BuildContext context) {
    var _mediaQury = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey, //New
              blurRadius: 15.0,
            )
          ],
        ),
        width: _mediaQury.size.width * .10,
        height: _mediaQury.size.height * .28,
        // color: Colors.amber,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 80,
                      height: 90,
                      // color: Colors.amber,
                      child: const CircleAvatar(
                        radius: 90,
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.amber,
                    width: 260,
                    height: _mediaQury.size.height * .2,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        hight20,
                        Text(
                          'Name :',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        hight10,
                        Text(
                          'Location :',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        hight10,
                        Text(
                          'Time :',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        hight10,
                        Text(
                          'Works:',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                // color: Colors.black,
                height: _mediaQury.size.height * .05,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: _mediaQury.size.width * 0.4,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(50), // <-- Radius
                              ),
                            ),
                            onPressed: () {},
                            child: const Icon(Icons.message_sharp)),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
