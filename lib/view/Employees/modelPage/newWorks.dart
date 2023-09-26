// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:homesefty/core/size/colors&size.dart';

class NewworkModel extends StatelessWidget {
  const NewworkModel({super.key, required this.details});
  final Map<String, dynamic> details;

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
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
                    child: SizedBox(
                        width: 80,
                        height: 90,
                        // color: Colors.amber,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20), // Image border
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(48), // Image radius
                            child: Image.network(details['userimagurl'] ?? "https://www.biiainsurance.com/wp-content/uploads/2015/05/no-image.jpg",
                                fit: BoxFit.cover),
                          ),
                        )
                        // CircleAvatar(  child: ClipOval(child: Image.network(details['userimagurl'] ,)),
                        //   radius: 90,
                        // ),
                        ),
                  ),
                  Width10,
                  SizedBox(
                    // color: Colors.amber,
                    width: 260,
                    height: _mediaQury.size.height * .2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        hight20,
                        Text(
                          'Name :  ${details['username']}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        hight10,
                        Text(
                          'Location :  ${details['address']}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        hight10,
                        Text(
                          'Time :   ${details['date']}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        hight10,
                        Text(
                          'Works:  ${details['work']} ',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                // color: Colors.black,
                height: _mediaQury.size.height * .05,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
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
                            child: const Icon(Icons.add_reaction_sharp)),
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
