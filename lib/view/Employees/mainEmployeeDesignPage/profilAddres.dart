import 'package:flutter/material.dart';
import 'package:homesefty/core/Colors%20,%20Width%20,%20Hight/colors&size.dart';
import 'package:homesefty/core/textFromFild/Location.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/hiddenDrawer.dart';

class EmployeProfilePage extends StatefulWidget {
  const EmployeProfilePage({super.key});

  @override
  State<EmployeProfilePage> createState() => _EmployeProfilePageState();
}

class _EmployeProfilePageState extends State<EmployeProfilePage> {
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
                hinttext: 'Phone Number',
              ),
              // const DetailsProfilepage(
              //   hinttext: 'hinttext',
              // ),
              // ChosseOptionPage(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ChosseOptionPage(),
                  DetailsProfilepage(
                    widths: _mediaqury.size.width * 0.4,
                    hinttext: 'Age',
                  ),
                ],
              ),
              // const DetailsProfilepage(
              //   hinttext: 'hinttext',
              // ),
              const DetailsProfilepage(
                hinttext: 'Address ',
                line: 3,
              ),
              // const Wrap(
              //   direction: Axis.horizontal,
              //   children: [
              //     // DetailsProfilepage(
              //     //   hinttext: 'hinttext',
              //     // ),
              //     // DetailsProfilepage(
              //     //   hinttext: 'hinttext',
              //     // ),
              //   ],
              // ),
              // Employeeswork(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: _mediaqury.size.width,
                  // height: _mediaqury.size.height * .5,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                              // context and builder are
                              // required properties in this widget
                              context: context,
                              builder: (BuildContext context) {
                                // we set up a container inside which
                                // we create center column and display text

                                // Returning SizedBox instead of a Container
                                return SizedBox(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Employeeswork(),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Add Works',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Wrap(
                          children: categories.map((favorite) {
                            if (favorite['ischecked'] == true) {
                              return Card(
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                shadowColor: Colors.blue,
                                elevation: 8,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        favorite['name'],
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      // TextButton(
                                      //     onPressed: () {},
                                      //     child: const Text('data')),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              favorite['ischecked'] =
                                                  !favorite['ischecked'];
                                            });
                                          },
                                          child: const Icon(
                                              Icons.delete_forever_rounded))
                                    ],
                                  ),
                                ),
                              );
                            }
                            return Container();
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
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
