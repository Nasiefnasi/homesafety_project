import 'package:flutter/material.dart';
import 'package:homesefty/view/Design%20Page/loginpage.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/hiddenDrawer.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
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
