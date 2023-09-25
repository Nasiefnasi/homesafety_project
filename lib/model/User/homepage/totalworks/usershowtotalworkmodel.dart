// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:homesefty/core/size/colors&size.dart';

class UserHomePageWorks extends StatelessWidget {
  const UserHomePageWorks({
    super.key,
    required MediaQueryData mediaqury,
    required this.workname, this.lottie,
  }) : _mediaqury = mediaqury;

  final MediaQueryData _mediaqury;
  final workname;
 final lottie;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var mediaqury = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:  const Color.fromARGB(255, 224, 221, 222),
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          // direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              width: _mediaqury.size.width,
              height: 85,
              color: Colors.amber,
              child: lottie,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                workname,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            hight10,
          ],
        ),
        // height: 20,d
        // width: _mediaqury.size.width * .1,
      ),
    );
  }
}
