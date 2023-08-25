 import 'package:flutter/material.dart';
import 'package:homesefty/core/size/colors&size.dart';

class UserStatusLevel extends StatelessWidget {
  const UserStatusLevel({super.key});
  // final Names;
  // final date;

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
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
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 241, 246, 242),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            width: double.infinity,
            height: 200,
            child: Column(children: [
              hight20,
              Text(
                'Status Level',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              hight20,
              Container(
                  height: 100,
                  width: 500,
                  child: Image.asset('asset/animation/status 2.png'))
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
                        title: const Text('Select your Option'),
                        shadowColor: Colors.black,
                        actions: [
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    _showbottomStatusLeve();
                                  },
                                  child: const Text(
                                    "Status Level",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 3, 108, 6),
                                        fontSize: 20),
                                  )),
                              const Divider(thickness: 2),
                              TextButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     // MaterialPageRoute(
                                    //     //   // builder: (context) => ,
                                    // ));
                                  },
                                  child: const Text(
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