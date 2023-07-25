import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:homesefty/core/Colors%20,%20Width%20,%20Hight/colors&size.dart';
// import 'package:homesefty/Core/Colors%20,%20Width%20,%20Hight/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/home.dart';
import 'package:homesefty/view/User/designPage/setDatenadtime.dart';
import 'package:lottie/lottie.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var _mediaqury = MediaQuery.of(context);
    return Scaffold(
      drawer: const UserNewDrawer(Colorss: Colors.accents),
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 80,
              color: Colors.green,
            ),
            SizedBox(
              width: double.infinity,
              height: _mediaqury.size.height * .10,
              // color: Colors.amber,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Which service do you \nneed?',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: _mediaqury.size.width * 9,
              // color: Colors.red,
              height: _mediaqury.size.height * .35,
              child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: [
                    UserHomePageWorks(
                        mediaqury: _mediaqury, workname: 'Electronics'),
                    UserHomePageWorks(
                        mediaqury: _mediaqury, workname: 'Painter'),
                    UserHomePageWorks(
                        mediaqury: _mediaqury, workname: 'Plumber'),
                    UserHomePageWorks(
                        mediaqury: _mediaqury, workname: 'Driver'),
                    UserHomePageWorks(
                        mediaqury: _mediaqury, workname: 'Gardener'),
                    UserHomePageWorks(mediaqury: _mediaqury, workname: 'Cook'),
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
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return UserStatusLevel();
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
  const UserHomePageWorks({
    super.key,
    required MediaQueryData mediaqury,
    required this.workname,
  }) : _mediaqury = mediaqury;

  final MediaQueryData _mediaqury;
  final workname;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ScheduleTimeAndDate();
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
  const UserNewDrawer({
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
            size: 25,
            color: Colors.white,
          ),
          title: Text(
            'Personal Details',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.abc,
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
            Icons.abc,
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
        const ListTile(
          leading: Icon(
            Icons.logout,
            size: 25,
            color: Colors.white,
          ),
          title: Text(
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
