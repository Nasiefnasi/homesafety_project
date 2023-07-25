import 'package:flutter/material.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:homesefty/core/Colors%20,%20Width%20,%20Hight/colors&size.dart';
import 'package:homesefty/view/Employees/mainEmployeeDesignPage/chatPage.dart';

class TextFormfildWidget extends StatelessWidget {
  const TextFormfildWidget(
      {super.key, required this.hinttext, required this.Iconss});
  final hinttext;
  final Iconss;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadowColor: Colors.blue,
          elevation: 5,
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hinttext,
              hintStyle: const TextStyle(),
              prefixIcon: Iconss,
            ),
          )),
    );
  }
}

//

// class DetailsProfilepage extends StatelessWidget {
//   const DetailsProfilepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return i;
//   }
// }

class DetailsProfilepage extends StatefulWidget {
  const DetailsProfilepage({
    super.key,
    required this.hinttext,
    this.line,
    this.widths,
  });
  final hinttext;
  final line;
  final widths;

  @override
  State<DetailsProfilepage> createState() => _DetailsProfilepageState();
}

class _DetailsProfilepageState extends State<DetailsProfilepage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Container(
        width: widget.widths ?? double.infinity,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          shadowColor: Colors.blue,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: widget.hinttext),
              maxLines: widget.line ?? null,
            ),
          ),
        ),
      ),
    );
  }
}

class ChosseOptionPage extends StatefulWidget {
  const ChosseOptionPage({super.key});

  @override
  State<ChosseOptionPage> createState() => _ChosseOptionPageState();
}

class _ChosseOptionPageState extends State<ChosseOptionPage> {
  String? valuechoose;
  List<String> listitem = ["male", "Fmale", "gender"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 180,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadowColor: Colors.blue,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: DropdownButton(
              isExpanded: true,
              underline: const SizedBox(),
              hint: const Text('Select Option '),
              value: valuechoose,
              items: listitem.map((valueitem) {
                return DropdownMenuItem(
                  value: valueitem,
                  child: Text(valueitem),
                );
              }).toList(),
              onChanged: (Newvalue) {
                setState(() {
                  valuechoose = Newvalue;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class UserStatusLevel extends StatelessWidget {
  const UserStatusLevel({super.key});
  // final Names;
  // final date;

  @override
  Widget build(BuildContext context) {
    void _showbottomStatusLeve() {
      showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
        ),
        elevation: 50,
        backgroundColor: const Color.fromARGB(38, 22, 23, 23),
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            width: double.infinity,
            height: 200,
            child: Column(children: [
              Text(
                'Status Level',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ]),
          );
        },
      );
    }

    return SizedBox(
      height: 90,
      // color: Colors.amber,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const CircleAvatar(
              radius: 30,
            ),
            title: const Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: const Text(
              'Date',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            trailing: IconButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Select your Option'),
                        shadowColor: Colors.black,
                        actions: [
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    _showbottomStatusLeve();
                                  },
                                  child: Text(
                                    "Status Level",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 3, 108, 6),
                                        fontSize: 20),
                                  )),
                              Divider(thickness: 2),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Chatpage(),
                                        ));
                                  },
                                  child: Text(
                                    "   Chat",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 3, 108, 6),
                                        fontSize: 20),
                                  )),
                            ],
                          )
                        ],
                      );
                      // );
                      // child: AlertDialog(
                      //   title: Text('Welcome'),
                      //   content: Text('GeeksforGeeks'),
                      //   actions: [
                      //     ElevatedButton(
                      //       // textColor: Colors.black,
                      //       onPressed: () {},
                      //       child: Text('CANCEL'),
                      //     ),
                      //     ElevatedButton(
                      //       // textColor: Colors.black
                      //       onPressed: () {},
                      //       child: Text('ACCEPT'),
                      //     ),
                      //   ],
                      // ),
                      // );
                    },
                  );
                },
                icon: const Icon(Icons.more_vert_rounded)),
          ),
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Width10,
          //     CircleAvatar(
          //       child: CircleAvatar(
          //         radius: 30,
          //         backgroundColor: Colors.amber,
          //       ),
          //       radius: 35,
          //     ),
          //     Width10,
          //     SizedBox(
          //       width: 120,
          //       child: Text(
          //         'Name',
          //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          //       ),
          //     ),
          //     Text(
          //       'Date',
          //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          //     ),
          //     Spacer(),
          //     Text(
          //       'Status',
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 15,
          //           color: Color.fromARGB(255, 43, 100, 147)),
          //     ),
          //     Width10,
          //   ],
          // ),
        ),
      ),
    );
  }
}

class WorkEmployeesAvailable extends StatelessWidget {
  const WorkEmployeesAvailable({super.key});
  // final Names;
  // final date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 90,
        // color: Colors.amber,
        width: double.infinity,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: const Color.fromARGB(31, 200, 198, 198),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Width10,
                CircleAvatar(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.amber,
                  ),
                  radius: 35,
                ),
                Width10,
                SizedBox(
                  width: 120,
                  child: Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                // Text(
                //   'Date',
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                // ),
                Spacer(),
                Text(
                  'Status',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromARGB(255, 43, 100, 147)),
                ),
                Width10,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmployesWorkConformation extends StatefulWidget {
  const EmployesWorkConformation({
    super.key,
    required this.hinttext,
    this.line,
    this.widths,
  });
  final hinttext;
  final double? line;
  final widths;

  @override
  State<EmployesWorkConformation> createState() =>
      _EmployesWorkConformationState();
}

class _EmployesWorkConformationState extends State<EmployesWorkConformation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SizedBox(
        width: widget.widths ?? double.infinity,
        // height: widget.line ?? 2,
        height: widget.line,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            shadowColor: Colors.teal,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  height: widget.line ?? 25,
                  child: Text(
                    widget.hinttext,
                    style: const TextStyle(fontSize: 20, color: Colors.grey),
                  )),
            )),
      ),
    );
  }
}

class NotCompletedListModel extends StatelessWidget {
  const NotCompletedListModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 80,
        // color: Colors.amber,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            shadowColor: Colors.teal,
            elevation: 5,
            color: const Color.fromARGB(255, 233, 230, 230),
            child: Row(
              children: [
                Width10,
                const CircleAvatar(
                  radius: 30,
                  child: CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.white,
                  ),
                ),
                Width10,
                Container(
                  // color: Colors.amber,
                  width: 150,
                  child: const Text(
                    'User Name',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                const Spacer(),
                Container(
                  // color: Colors.amber,
                  width: 100,
                  child: const Text(
                    'Not completed',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
                const SizedBox(
                  width: 5,
                )
              ],
            )),
      ),
    );
  }
}

class SuccessfulPaymentListModel extends StatelessWidget {
  const SuccessfulPaymentListModel({super.key, this.indexss});
  final indexss;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 80,
        // color: Colors.amber,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            shadowColor: Colors.teal,
            elevation: 5,
            color: const Color.fromARGB(255, 233, 230, 230),
            child: Row(
              children: [
                Width20,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // color: Colors.amber,
                      width: 150,
                      child: const Text(
                        'User Name',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    Container(
                      // color: Colors.amber,
                      width: 150,
                      child: const Text(
                        'Work',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  // color: Colors.amber,
                  width: 70,
                  child: Text(
                    '+₹ ${indexss}',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 10, 102, 13)),
                  ),
                ),
                const SizedBox(
                  width: 5,
                )
              ],
            )),
      ),
    );
  }
}
