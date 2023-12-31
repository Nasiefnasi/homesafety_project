import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/MODEL/User/firbasedetails/firbaseget.dart';
import 'package:homesefty/VIEW/Design%20Page/Hive/user_model.dart';
import 'package:homesefty/VIEW/Employees/ratingloopfuntion.dart';
import 'package:homesefty/controller/employes/chat/chat.dart';
import 'package:homesefty/controller/employes/employeWorkConform/employeconformwork.dart';
import 'package:homesefty/controller/employes/notCompleted/workNotCompleted.dart';
import 'package:homesefty/controller/employes/payment%20request/employPayRequest.dart';
import 'package:homesefty/controller/employes/workStatus/level.dart';
import 'package:homesefty/controller/getxemployessprofile/heroemployes.dart';
import 'package:homesefty/controller/user/allwork/selectwork.dart';
import 'package:homesefty/controller/user/chatpage/chating.dart';
import 'package:homesefty/controller/user/feedback/feedback.dart';
import 'package:homesefty/provider/navBar.dart';
import 'package:homesefty/view/Design%20Page/loginpage.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserPersonalDetailget(),
    ),
    ChangeNotifierProvider(
      create: (context) => Shared_preferences(),
    ),
    ChangeNotifierProvider(
      create: (context) => frrrating(),
    ),
    ChangeNotifierProvider(
      create: (context) => Rating(),
    ),
    ChangeNotifierProvider(
      create: (context) => EmployPayRequest(),
    ),
    ChangeNotifierProvider(
      create: (context) => WorkNotCompleted(),
    ),
    ChangeNotifierProvider(
      create: (context) => UserChating(),
    ),
    ChangeNotifierProvider(
      create: (context) => EmployeChating(),
    ),
    ChangeNotifierProvider(
      create: (context) => EmployStatusLevel(),
    ),
    ChangeNotifierProvider(
      create: (context) => conformworkdatasave(),
    ),
    ChangeNotifierProvider(
      create: (context) => SelectWorkPage(),
    ),
    ChangeNotifierProvider(create: (context) => EmployesDetailsControl()),
    // ChangeNotifierProvider(create: (context) => EmployeesProfilePage(),),
    // ChangeNotifierProvider(create: (context) =>Authcontroler() ,),
    ChangeNotifierProvider(create: (context) => NavBar()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

        // color: Colors.amber,colo
        debugShowCheckedModeBanner: false,
        // home: EmployeProfilePage(),col
        home: LoginPage());
    //  home: BottoNavBar());ZZ
  }
}
