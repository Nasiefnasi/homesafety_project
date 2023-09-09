import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/employes/employeWorkConform/employeconformwork.dart';
// import 'package:homesefty/controller/employes/getxemployessprofile/heroemployes.dart';
import 'package:homesefty/controller/getxemployessprofile/heroemployes.dart';
import 'package:homesefty/controller/user/allwork/selectwork.dart';
import 'package:homesefty/provider/navBar.dart';
import 'package:homesefty/view/Design%20Page/loginpage.dart';
import 'package:homesefty/view/Employees/profilePage/employeprofiledetailspageinsert.dart';
import 'package:homesefty/view/User/designPage/homePage/homepage.dart';
import 'package:homesefty/view/User/designPage/navBar/navbar.dart';
// import 'package:homesefty/view/Design%20Page/loginpage.dart';

// import 'package:homesefty/view/User/designPage/homePage/homepage.dart';
// import 'package:homesefty/view/Design%20Page/loginpage.dart';
// import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';
// import 'package:homesefty/view/Employees/profilePage/employeprofiledetailspageinsert.dart';
// import 'package:homesefty/view/Employees/profilePage/profilepagedetails.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => conformworkdatasave(),),
    ChangeNotifierProvider(create: (context) => SelectWorkPage(),),
    ChangeNotifierProvider(create: (context) => EmployesDetailsControl()),
    // ChangeNotifierProvider(create: (context) => EmployeesProfilePage(),),
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
    return GetMaterialApp(
      

        // color: Colors.amber,colo
        debugShowCheckedModeBanner: false,
        // home: EmployeProfilePage(),col
        home: LoginPage());
    //  home: BottoNavBar());
  }
}
