// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:homesefty/controller/employes/getxemployessprofile/heroemployes.dart';
import 'package:homesefty/controller/getxemployessprofile/heroemployes.dart';
import 'package:homesefty/controller/user/allwork/selectwork.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:homesefty/core/size/colors&size.dart';
// import 'package:homesefty/view/Employees/mainEmployeeDesignPage/chatPage.dart';
import 'package:provider/provider.dart';

class TextFormfildWidget extends StatelessWidget {
  const TextFormfildWidget(
      {super.key, required this.hinttext, required this.Iconss, this.contro});
  final hinttext;
  final Iconss;
  final contro;

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
            controller: contro,
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

// class DetailsProfilepage extends StatelessWidget {
//   const DetailsProfilepage({
//     super.key,
//      this.hinttext,
//     this.line,
//     this.widths,
//     this.validatormessage, this.keybord, this.initialvalu, required this.contros,
//   });
//   final hinttext;
//   final line;
//   final widths;
//   final  contros;
//   final validatormessage;
//   final keybord;
//   final initialvalu;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//       child: Container(
//         width: widths ?? double.infinity,
        
//         child: Card(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//           // shadowColor: const Color.fromARGB(255, 161, 161, 161),
//           elevation: 5,
//           child: Padding(
//             padding: EdgeInsets.all(15),
//             child: TextFormField( 
//               validator:  (value) {
//                   if (value == null || value.isEmpty) {
//                     return validatormessage ;
//                   }
//                   return null;
//                 },
//               controller: contros,
//               decoration:
//                   InputDecoration( border: InputBorder.none, hintText: hinttext, hintStyle: TextStyle()),
//               maxLines: line ?? 1,
//               keyboardType: keybord ,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class DetailsProfilepage extends StatelessWidget {
  const DetailsProfilepage({
    super.key,
    required this.hinttext,
    this.line,
    this.widths,
    this.contros, this.validatormessage, this.keybord,
  });
  final hinttext;
  final line;
  final widths;
  final contros;
  final validatormessage;
   final keybord;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        width: widths ?? double.infinity,
        
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          shadowColor: Colors.blue,
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField( validator:  (value) {
                  if (value == null || value.isEmpty) {
                    return validatormessage ;
                  }
                  return null;
                },
              controller: contros,
              decoration:
                  InputDecoration( border: InputBorder.none, hintText: hinttext),
              maxLines: line ?? 1,
            ),
          ),
        ),
      ),
    );
  }
}

class ChosseOptionPage extends StatefulWidget {

  const ChosseOptionPage({super.key,});
  

  @override
  State<ChosseOptionPage> createState() => _ChosseOptionPageState();
}

class _ChosseOptionPageState extends State<ChosseOptionPage> {
  String? valuechoose;
   String? sex;
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
              // ignore: non_constant_identifier_names
              onChanged: (Newvalue) {
                setState(() {
                  valuechoose = Newvalue;
                   Provider.of<EmployesDetailsControl>(context, listen: false).getSex(valuechoose!);
        

                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
class DistrictSelectionWidget extends StatefulWidget {

  const DistrictSelectionWidget({super.key, });



  @override
  State<DistrictSelectionWidget> createState() => _DistrictSelectionWidgetState();
}

class _DistrictSelectionWidgetState extends State<DistrictSelectionWidget> {
  String? valuechoose;
  
  

   String? sex;
  List<String> listitem = [ 'Alappuzha', 'Ernakulam', 'Kozhikode', 'Palakkad', 'Kollam', 'Kannur', 'Kasaragod', 'Idukki', 'Kottayam', 'Thrissur', 'Pathanamthitta', 'Malappuram', 'Wayanad', 'Thiruvananthapuram'];
  @override
  Widget build(BuildContext context) {
 
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
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
              hint: const Text('District'),
              value: valuechoose,
              items: listitem.map((valueitem) {
                return DropdownMenuItem(
                  value: valueitem,
                  child: Text(valueitem),
                );
              }).toList(),
              // ignore: non_constant_identifier_names
              onChanged: (Newvalue) {
                setState(() {
                  valuechoose = Newvalue;
                 
                   Provider.of<SelectWorkPage>(context, listen: false).selectdistrict(valuechoose!);
        

                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

// class UserStatusLevel extends StatelessWidget {
//   const UserStatusLevel({super.key});
//   // final Names;
//   // final date;

//   @override
//   Widget build(BuildContext context) {
//     // ignore: no_leading_underscores_for_local_identifiers
//     void _showbottomStatusLeve() {
//       showModalBottomSheet(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
//         ),
//         elevation: 50,
//         backgroundColor: const Color.fromARGB(38, 22, 23, 23),
//         context: context,
//         builder: (context) {
//           return Container(
//             decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 241, 246, 242),
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
//             width: double.infinity,
//             height: 200,
//             child: Column(children: [
//               hight20,
//               Text(
//                 'Status Level',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               hight20,
//               Container(
//                   height: 100,
//                   width: 500,
//                   child: Image.asset('asset/animation/status 2.png'))
//             ]),
//           );
//         },
//       );
//     }

//     return SizedBox(
//       height: 90,
//       // color: Colors.amber,
//       width: double.infinity,
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListTile(
//             leading: const CircleAvatar(
//               radius: 30,
//             ),
//             title: const Text(
//               'Name',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//             subtitle: const Text(
//               'Date',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//             ),
//             trailing: IconButton(
//                 onPressed: () async {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: const Text('Select your Option'),
//                         shadowColor: Colors.black,
//                         actions: [
//                           Row(
//                             children: [
//                               TextButton(
//                                   onPressed: () {
//                                     _showbottomStatusLeve();
//                                   },
//                                   child: const Text(
//                                     "Status Level",
//                                     style: TextStyle(
//                                         color: Color.fromARGB(255, 3, 108, 6),
//                                         fontSize: 20),
//                                   )),
//                               const Divider(thickness: 2),
//                               TextButton(
//                                   onPressed: () {
//                                     // Navigator.push(
//                                     //     context,
//                                     //     // MaterialPageRoute(
//                                     //     //   // builder: (context) => ,
//                                     // ));
//                                   },
//                                   child: const Text(
//                                     "   Chat",
//                                     style: TextStyle(
//                                         color: Color.fromARGB(255, 3, 108, 6),
//                                         fontSize: 20),
//                                   )),
//                             ],
//                           )
//                         ],
//                       );
//                       // );
//                       // child: AlertDialog(
//                       //   title: Text('Welcome'),
//                       //   content: Text('GeeksforGeeks'),
//                       //   actions: [
//                       //     ElevatedButton(
//                       //       // textColor: Colors.black,
//                       //       onPressed: () {},
//                       //       child: Text('CANCEL'),
//                       //     ),
//                       //     ElevatedButton(
//                       //       // textColor: Colors.black
//                       //       onPressed: () {},
//                       //       child: Text('ACCEPT'),
//                       //     ),
//                       //   ],
//                       // ),
//                       // );
//                     },
//                   );
//                 },
//                 icon: const Icon(Icons.more_vert_rounded)),
//           ),
//           // child: Row(
//           //   mainAxisAlignment: MainAxisAlignment.start,
//           //   children: [
//           //     Width10,
//           //     CircleAvatar(
//           //       child: CircleAvatar(
//           //         radius: 30,
//           //         backgroundColor: Colors.amber,
//           //       ),
//           //       radius: 35,
//           //     ),
//           //     Width10,
//           //     SizedBox(
//           //       width: 120,
//           //       child: Text(
//           //         'Name',
//           //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//           //       ),
//           //     ),
//           //     Text(
//           //       'Date',
//           //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//           //     ),
//           //     Spacer(),
//           //     Text(
//           //       'Status',
//           //       style: TextStyle(
//           //           fontWeight: FontWeight.bold,
//           //           fontSize: 15,
//           //           color: Color.fromARGB(255, 43, 100, 147)),
//           //     ),
//           //     Width10,
//           //   ],
//           // ),
//         ),
//       ),
//     );
//   }
// }

// class WorkEmployeesAvailable extends StatelessWidget {
//   const WorkEmployeesAvailable({super.key,  this.imaheurl, required this.Names});
//   final List<String> Names;
//   final imaheurl;

//   @override
//   Widget build(BuildContext context) {
//     // return Padding(
//     //   padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
//     //   child: SizedBox(
//     //     height: 60,
//     //     // color: Colors.amber,
//     //     width: double.infinity,
//     //     child: Card(
//     //       shape:
//     //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//     //       color: Colors.blue[100],
//     //       child:  Padding(
//     //         padding: EdgeInsets.all(8.0),
//     //         child: Row(
//     //           // mainAxisAlignment: MainAxisAlignment.center,
//     //           crossAxisAlignment: CrossAxisAlignment.center,
//     //           children: [
//     //             Width10,
//     //             CircleAvatar(
//     //               child: CircleAvatar(
//     //                 child: Image.network(imaheurl),
//     //                 radius: 30,
//     //                 backgroundColor: Colors.amber,
//     //               ),
//     //               radius: 35,
//     //             ),
                
//     //             SizedBox(
//     //               width: 120,
//     //               child: Text(
//     //                 Names,
//     //                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15,color: Colors.grey),
//     //               ),
//     //             ),
//     //             // Text(
//     //             //   'Date',
//     //             //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//     //             // ),
//     //             Spacer(),
//     //             Text(
//     //               'Details',
//     //               style: TextStyle(
//     //                   fontWeight: FontWeight.bold,
//     //                   fontSize: 15,
//     //                   color: Color.fromARGB(255, 43, 100, 147)),
//     //             ),
//     //             Width10,
//     //           ],
//     //         ),
//     //       ),
//     //     ),
//     //   ),
//     // );
//   }
// }

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
