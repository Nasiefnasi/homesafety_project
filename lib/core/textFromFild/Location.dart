import 'package:flutter/material.dart';

class LicationPage extends StatelessWidget {
  const LicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          height: 200,
          width: double.infinity,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            shadowColor: Colors.blue,
            elevation: 5,
            child: Image.network(
              'https://www.indianclimate.com/images/0JMAAFJ8V7.png',
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
