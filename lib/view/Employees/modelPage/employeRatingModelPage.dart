import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homesefty/core/Colors%20,%20Width%20,%20Hight/colors&size.dart';

class RatingEmployessPage extends StatefulWidget {
  const RatingEmployessPage({super.key});

  @override
  State<RatingEmployessPage> createState() => _RatingEmployessPageState();
}

class _RatingEmployessPageState extends State<RatingEmployessPage> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  child: const Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley',
                    style: TextStyle(color: Color.fromARGB(255, 108, 106, 106)),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
