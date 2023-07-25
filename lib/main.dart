import 'package:flutter/material.dart';
import 'package:homesefty/view/User/designPage/navBar/navbar.dart';
import 'package:homesefty/view/User/uesrtextformfield/paymentrequest.dart';

import 'package:homesefty/provider/navBar.dart';
import 'package:homesefty/view/adminPage/AdmindesignPage/adminDesign/AdminHomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => NavBar(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        // color: Colors.amber,colo
        debugShowCheckedModeBanner: false,
        // home: EmployeProfilePage(),col
        home: AdminHomePage());
  }
}
