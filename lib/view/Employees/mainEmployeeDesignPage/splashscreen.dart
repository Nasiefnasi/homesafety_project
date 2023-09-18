import 'package:flutter/material.dart';
import 'package:homesefty/view/Design%20Page/loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      color: Colors.amber,
    );
  }
}
