// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:homesefty/core/size/colors&size.dart';

class EmployHomepageRating extends StatelessWidget {
 EmployHomepageRating({
    super.key,
    required this.datas,  
    
  });
 
  final Map<String, dynamic> datas;

  // double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(
                      datas['userName'],
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 121, 120, 120),
                          fontSize: 25),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundImage: NetworkImage(datas['userurl']),
                    )
                  ]),
                ),
                // color: Color.fromARGB(250, 244, 26, 11),
              ),
              hight30,
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: SizedBox(
              //     width: double.infinity,
              //     height: 36,
              //     child: RatingBar.builder(
              //       itemSize: 25,
              //       minRating: 0,
              //       glowColor: Colors.black,
              //       itemBuilder: (context, index) => const Icon(
              //         Icons.star,
              //         color: Colors.amber,
              //       ),
              //       onRatingUpdate: (rating) => setState(() {
              //         this.rating = rating;
              //       }),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 63,
                  child: Center(
                    child: Text(maxLines:  5,overflow: TextOverflow.ellipsis,textAlign:TextAlign.left ,
                     datas['feedback'].toString() ,
                      style: const TextStyle(color: Color.fromARGB(255, 108, 106, 106)),
                    ),
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
