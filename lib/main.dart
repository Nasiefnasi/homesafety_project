import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/getxemployessprofile/heroemployes.dart';

import 'package:homesefty/provider/navBar.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/employeprofiledetailspage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    // ChangeNotifierProvider(create: (context) =>Authcontroler() ,),
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
    return const GetMaterialApp(

        // color: Colors.amber,colo
        debugShowCheckedModeBanner: false,
        // home: EmployeProfilePage(),col
        home: EmployeProfilePage());
    //  home: EmployeProfilePage());
  }
}
