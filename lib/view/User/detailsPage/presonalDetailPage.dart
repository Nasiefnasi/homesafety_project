import 'package:flutter/material.dart';
import 'package:homesefty/core/Colors%20,%20Width%20,%20Hight/colors&size.dart';
import 'package:homesefty/core/textFromFild/Location.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/hiddenDrawer.dart';

class UserpersonalDetailesPage extends StatefulWidget {
  const UserpersonalDetailesPage({super.key});

  @override
  State<UserpersonalDetailesPage> createState() =>
      _UserpersonalDetailesPageState();
}

class _UserpersonalDetailesPageState extends State<UserpersonalDetailesPage> {
  List<Map> categories = [
    {'name': 'plumber', 'ischecked': false},
    {'name': 'dssdmber', 'ischecked': false},
    {'name': 'dsdsvdser', 'ischecked': false},
    {'name': 'plsdvsdver', 'ischecked': false},
    {'name': 'bnfr', 'ischecked': false},
    {'name': 'ppdsdsumber', 'ischecked': false},
    {'name': 'wmber', 'ischecked': false},
  ];
  @override
  Widget build(BuildContext context) {
    var _mediaqury = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hight30,
              Container(
                color: const Color.fromARGB(0, 255, 255, 255),
                width: _mediaqury.size.width * 0.6,
                height: _mediaqury.size.height * 0.3,
                child: const CircleAvatar(),
              ),
              SizedBox(
                width: _mediaqury.size.width * 0.4,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('add image'),
                ),
              ),
              const DetailsProfilepage(
                hinttext: 'Full Name',
              ),
              const DetailsProfilepage(
                hinttext: 'Address ',
                line: 5,
              ),
              const DetailsProfilepage(
                hinttext: 'Phone Number',
              ),

              const DetailsProfilepage(
                hinttext: 'Experience',
              ),
              const DetailsProfilepage(
                hinttext: 'District',
              ),
              const DetailsProfilepage(
                hinttext: 'State',
              ),
              // const DetailsProfilepage(
              //   hinttext: 'hinttext',
              // ),
              LicationPage(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: _mediaqury.size.width * .4,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Current Location'),
                      ),
                    ),
                  ],
                ),
              ),
              hight30,

              SizedBox(
                width: _mediaqury.size.width * 0.9,
                height: _mediaqury.size.height * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HiddenDrawer(),
                        ),
                        (route) => false);
                  },
                  child: const Text(
                    "Save Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              hight30,

              // TextFormfildWidget(hinttext: '', Iconss: Icons.abc_outlined)
            ],
          ),
        ],
      )),
    );
  }

  Column Employeeswork() {
    return Column(
        children: categories.map(
      (favoritevalu) {
        return CheckboxListTile(
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          title: Text(favoritevalu['name']),
          value: favoritevalu['ischecked'],
          onChanged: (val) {
            setState(() {
              favoritevalu['ischecked'] = val;
            });
          },
        );
      },
    ).toList());
  }
}
