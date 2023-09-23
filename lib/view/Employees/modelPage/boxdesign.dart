import 'package:flutter/material.dart';

class Boxdesign extends StatelessWidget {
  const Boxdesign({super.key, required this.child});
  final child;

  @override
  Widget build(BuildContext context) {
    return 
       Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 253, 253),
        borderRadius: BorderRadius.circular(20),
        // shape:BoxShape.circle ,
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 100, 98, 98),
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1),
          BoxShadow(
              color: Color.fromARGB(255, 223, 223, 223),
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 2)
        ]),
        child: Center(child: child),
      
    );
  }
}
