import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bottomnavigation extends StatelessWidget {
  const Bottomnavigation({super.key, required this.ontap, required this.icon});
  final void Function() ontap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        width: 50,
        height: 59,
        child: Icon(
          icon,
          color: const Color.fromARGB(255, 235, 235, 235),
        ),
      ),
    );
  }
}
