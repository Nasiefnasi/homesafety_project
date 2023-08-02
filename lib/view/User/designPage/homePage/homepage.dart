// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/user/getxController/authcontroler/authcontroler.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/User/designPage/setDatenadtime.dart';
import 'package:homesefty/view/User/userpersonaletailspage/userpersonaldetails.dart';
import 'package:lottie/lottie.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    var mediaqury = MediaQuery.of(context);
    return Scaffold(
      drawer: UserNewDrawer(colorss: Colors.accents),
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 80,
                height: 80,
                child: Image.asset('asset/animation/LOGO-01.png'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: mediaqury.size.height * .10,
              // color: Colors.amber,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Which service do you \nneed?',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: mediaqury.size.width * 9,
              // color: Colors.red,
              height: mediaqury.size.height * .35,
              child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: [
                    UserHomePageWorks(
                        mediaqury: mediaqury, workname: 'Electronics'),
                    UserHomePageWorks(
                        mediaqury: mediaqury, workname: 'Painter'),
                    UserHomePageWorks(
                        mediaqury: mediaqury, workname: 'Plumber'),
                    UserHomePageWorks(mediaqury: mediaqury, workname: 'Driver'),
                    UserHomePageWorks(
                        mediaqury: mediaqury, workname: 'Gardener'),
                    UserHomePageWorks(mediaqury: mediaqury, workname: 'Cook'),
                  ]),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'STATUS LEVEL',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromARGB(255, 40, 116, 42)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return const UserStatusLevel();
                    },
                    itemCount: 10,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserHomePageWorks extends StatelessWidget {
  UserHomePageWorks({
    super.key,
    required MediaQueryData mediaqury,
    required this.workname,
  }) : _mediaqury = mediaqury;

  final MediaQueryData _mediaqury;
  final workname;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var mediaqury = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const ScheduleTimeAndDate();
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          clipBehavior: Clip.hardEdge,
          child: Wrap(
            alignment: WrapAlignment.center,
            // direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                width: _mediaqury.size.width,
                height: 85,
                child: Lottie.asset('asset/animation/animation_lk3s1v1o.json'),
                color: Colors.amber,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  workname,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 226, 226, 226),
          ),
          // height: 20,d
          // width: _mediaqury.size.width * .1,
        ),
      ),
    );
  }
}

class UserNewDrawer extends StatelessWidget {
  UserNewDrawer({
    super.key,
    this.colorss,
  });
  final colorss;
  final control = Get.put(Authcontroller());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 166, 126, 4),
      child: Column(children: [
        hight30,
        hight30,
        hight30,
        StreamBuilder<QuerySnapshot>(
          stream:FirebaseFirestore.instance.collection('userdetails').snapshots(),
          builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 6,
                    color: Colors.white,
                  ),
                  color: const Color.fromARGB(255, 5, 112, 92),
                  borderRadius: BorderRadius.circular(20)),
              width: 160,
              height: 160,
              child: Image.network(snapshot.data!.docs.first['imageUrl'],fit: BoxFit.cover,),
            );
          }
        ),
        hight20,
        ListTile(onTap: () {
          Get.to(PersonalDetailsPage() );
        },
          leading: const Icon(
            Icons.person,
            size: 25,
            color: Colors.white,
          ),
          title: const Text(
            'Personal Details',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.payments_rounded,
            size: 25,
            color: Colors.white,
          ),
          title: Text(
            'Payment Request',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.room_preferences_outlined,
            size: 25,
            color: Colors.white,
          ),
          title: Text(
            'Terms and Conditions',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.info,
            size: 25,
            color: Colors.white,
          ),
          title: Text(
            'About',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Get.bottomSheet(
                Wrap(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.abc),
                      title: const Text('Light Theme',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {
                        Get.changeTheme(ThemeData.light());
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.abc),
                      title: const Text(
                        'Dark Theme',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Get.changeTheme(ThemeData.dark());
                      },
                    ),
                  ],
                ),
                backgroundColor: Colors.amber);
          },
          leading: const Icon(
            Icons.sunny,
            size: 25,
            color: Colors.white,
          ),
          title: const Text(
            'Theme change',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            control.signout(context);
          },
          leading: const Icon(
            Icons.logout,
            size: 25,
            color: Colors.white,
          ),
          title: const Text(
            'Log Out',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
