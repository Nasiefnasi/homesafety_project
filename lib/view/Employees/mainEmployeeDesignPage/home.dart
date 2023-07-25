import 'package:flutter/material.dart';

import 'package:homesefty/view/Employees/modelPage/PandingWorkmodel.dart';
import 'package:homesefty/view/Employees/modelPage/employeRatingModelPage.dart';
import 'package:homesefty/core/Colors%20,%20Width%20,%20Hight/colors&size.dart';

class EmployesHome extends StatefulWidget {
  const EmployesHome({super.key});

  @override
  State<EmployesHome> createState() => _EmployesHomeState();
}

class _EmployesHomeState extends State<EmployesHome> {
  @override
  Widget build(BuildContext context) {
    bool ischange = false;
    var _mediaqury = MediaQuery.of(context);
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 22, 58, 61),
      drawer: NewDrawer(),
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 9, 88, 97),
      //   title: const Center(child: Text('Home')),
      //   actions: [const Icon(Icons.dashboard_customize_rounded)],
      //   leading: IconButton(
      //       onPressed: () {
      //         HiddenDrawer();
      //       },
      //       icon: const Icon(Icons.arrow_circle_left_sharp)),
      // ),
      body: SafeArea(
          child: Column(
        children: [
          hight10,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(205, 3, 110, 120),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text(
                      'Active',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    Switch(
                        value: ischange,
                        onChanged: (value) {
                          setState(() {
                            ischange = value;
                          });
                        })
                  ],
                ),
              ),
              height: _mediaqury.size.height * .08,
              width: double.infinity,
            ),
          ),
          hight10,
          // Container(
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return const RatingEmployessPage();
          //     },
          //     itemCount: 10,
          //   ),
          // ),

          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(8, 18, 255, 69),
                borderRadius: BorderRadius.all(Radius.circular(1))),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                    width: _mediaqury.size.width * 1,
                    child: const RatingEmployessPage());
              },
              itemCount: 10,
              shrinkWrap: false,
            ),
            height: _mediaqury.size.height * .25,
            // color: const Color.fromARGB(71, 21, 236, 129),
          ),
          hight10,
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Work Pending',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color.fromARGB(255, 87, 89, 90)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(110, 3, 80, 80),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: PandingworkStatusPPage(),
                  );
                },
                itemCount: 10,
                shrinkWrap: false,
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class NewDrawer extends StatelessWidget {
  const NewDrawer({
    super.key,
    this.Colorss,
  });
  final Colorss;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 4, 73, 57),
      child: Column(children: [
        hight30,
        hight30,
        hight30,
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                width: 6,
                color: Colors.white,
              ),
              color: const Color.fromARGB(255, 5, 112, 92),
              borderRadius: BorderRadius.circular(20)),
          width: 160,
          height: 160,
        ),
        hight20,
        const ListTile(
          leading: Icon(
            Icons.abc,
            size: 35,
            color: Colors.white,
          ),
          title: Text(
            'Personal Details',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.abc,
            size: 35,
            color: Colors.white,
          ),
          title: Text(
            'Terms and Conditions',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.info,
            size: 35,
            color: Colors.white,
          ),
          title: Text(
            'About',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.logout,
            size: 35,
            color: Colors.white,
          ),
          title: Text(
            'Log Out',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
