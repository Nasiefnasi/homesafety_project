// ignore_for_file: unused_local_variable, duplicate_ignore, non_constant_identifier_names, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers, unnecessary_import, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:homesefty/controller/getxemployessprofile/heroemployes.dart';
import 'package:homesefty/core/size/colors&size.dart';
// import 'package:homesefty/core/textFromFild/Location.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
// import 'package:homesefty/view/Employees/mainEmployeeDesignPage/hiddenDrawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EmployeProdilrUpdatePage extends StatefulWidget {
  const EmployeProdilrUpdatePage({super.key, required this.details});
  final Map<String, dynamic> details;

  @override
  State<EmployeProdilrUpdatePage> createState() =>
      _EmployeProdilrUpdatePageState();
}

class _EmployeProdilrUpdatePageState extends State<EmployeProdilrUpdatePage> {
  final formkey = GlobalKey<FormState>();
  // void addToWorks(String name) {
  //   Provider.of<EmployesDetailsControl>(context, listen: false)
  //       .works
  //       .add({'name': name});
  //   setState(() {});
  // }

  List<Map> categories = [
    {'name': 'election', 'ischecked': false},
    {'name': 'plumber', 'ischecked': false},
    {'name': 'driver', 'ischecked': false},
    {'name': 'cook', 'ischecked': false},
    {'name': 'cook', 'ischecked': false},
  ];
  @override
  Widget build(BuildContext context) {
    var _mediaqury = MediaQuery.of(context).size;
    return Consumer<EmployesDetailsControl>(
        builder: (context, employcontrl, child) {
      return Scaffold(
        body: SafeArea(
            child: ListView(
          children: [
            Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  hight30,
                  Container(
                    clipBehavior: Clip.none,
                    width: _mediaqury.width * 0.4,
                    height: _mediaqury.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 5,
                            color: const Color.fromARGB(255, 71, 33, 33))),
                    child: Obx(
                      () => employcontrl.imageshow.value == ''
                           ? Center(child: Image.network( "https://www.biiainsurance.com/wp-content/uploads/2015/05/no-image.jpg"))
                          // :Image.network(cotrol.selectimagepath),
                          : Image.file(File(employcontrl.imageshow.value),
                              fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: _mediaqury.width * 0.4,
                    child: ElevatedButton(
                      onPressed: () {
                        employcontrl.getimage(ImageSource.camera);
                      },
                      child: const Text('add image'),
                    ),
                  ),
                  DetailsProfilepage(
                      contros: employcontrl.name,
                      hinttext: widget.details['name']),
                  DetailsProfilepage(
                      contros: employcontrl.phone,
                      hinttext: widget.details['phone']),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ChosseOptionPage(),
                      DetailsProfilepage(
                          contros: employcontrl.ages,
                          widths: _mediaqury.width * 0.4,
                          hinttext: widget.details['age']),
                    ],
                  ),

                  DetailsProfilepage(
                    contros: employcontrl.address,
                    hinttext: widget.details['address'],
                    line: 3,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: _mediaqury.width,
                      height: _mediaqury.height * .5,
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
                                  context: context,
                                  builder: (BuildContext context) {
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    shadowColor: Colors.blue,
                                    elevation: 8,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // employcontrl.works.add({'name': favorite['name']}),
                                          Text(
                                            favorite['name'],
                                            style: const TextStyle(
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
                                                  if (favorite['ischecked']) {}
                                                  // else {
                                                  //   employcontrl.works
                                                  //       .removeWhere((work) =>
                                                  //           work['name'] ==
                                                  //           favorite['name']);
                                                  // }
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
                  DetailsProfilepage(
                    contros: employcontrl.experience,
                    hinttext: widget.details['experience'],
                  ),
                  UpfateDistrictSelectionWidget(text:widget.details['district'], )
                  ,
                  // DetailsProfilepage(
                  //   contros: employcontrl.district,
                  //   hinttext: widget.details['district'],
                  // ),
                  DetailsProfilepage(
                    contros: employcontrl.state,
                    hinttext: widget.details['state'],
                  ),
                  // const DetailsProfilepage(
                  //   hinttext: 'hinttext',
                  // ),
                  // const LicationPage(),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       SizedBox(
                  //         width: _mediaqury.width * .4,
                  //         child: ElevatedButton(
                  //           onPressed: () {},
                  //           child: const Text('Current Location'),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  hight30,

                  SizedBox(
                    width: _mediaqury.width * 0.9,
                    height: _mediaqury.height * 0.05,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          await addButton();
                        } else {
                          Get.snackbar("error", "pls Enter your Details");
                        }
                      },
                      child: employcontrl.loading.value
                          ? const CircularProgressIndicator()
                          : const Text(
                              "Save Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                    ),
                  ),
                  hight30,

                  // TextFormfildWidget(hinttext: '', Iconss: Icons.abc_outlined)
                ],
              ),
            ),
          ],
        )),
      );
    });
  }

  addButton() async {
    // ignore: unused_local_variable
    final cname = Provider.of<EmployesDetailsControl>(context, listen: false)
        .name
        .text
        .toString();
    final cphone = Provider.of<EmployesDetailsControl>(context, listen: false)
        .phone
        .text
        .toString();
    final cage = Provider.of<EmployesDetailsControl>(context, listen: false)
        .ages
        .text
        .toString();
    final caddress = Provider.of<EmployesDetailsControl>(context, listen: false)
        .address
        .text
        .toString();
    final cexperince =
        Provider.of<EmployesDetailsControl>(context, listen: false)
            .experience
            .text
            .toString();
    final cdistrics =
        Provider.of<EmployesDetailsControl>(context, listen: false)
            .district
         
            .toString();
    final cstate = Provider.of<EmployesDetailsControl>(context, listen: false)
        .state
        .text
        .toString();
    if (cname.isEmpty ||
        cphone.isEmpty ||
        cage.isEmpty ||
        caddress.isEmpty ||
        cexperince.isEmpty ||
        cdistrics.isEmpty ||
        cstate.isEmpty) {
      return;
    } else {
      await Provider.of<EmployesDetailsControl>(context, listen: false)
          .addemployea();
      Get.snackbar("Update", 'Successfull');
    }
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
class UpfateDistrictSelectionWidget extends StatefulWidget {

  const UpfateDistrictSelectionWidget({super.key, this.text, });
  final text;



  @override
  State<UpfateDistrictSelectionWidget> createState() => _UpfateDistrictSelectionWidgetState();
}

class _UpfateDistrictSelectionWidgetState extends State<UpfateDistrictSelectionWidget> {
  String? valuechoose;
  
  

   String? sex;
  List<String> listitem = [ 'Alappuzha', 'Ernakulam', 'Kozhikode', 'Palakkad', 'Kollam', 'Kannur', 'Kasaragod', 'Idukki', 'Kottayam', 'Thrissur', 'Pathanamthitta', 'Malappuram', 'Wayanad', 'Thiruvananthapuram'];
  @override
  Widget build(BuildContext context) {
 
    return Padding(
      padding:  const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadowColor: Colors.blue,
          elevation: 5,
          child: Padding(
            padding:  const EdgeInsets.only(left: 10, right: 10),
            child: DropdownButton(
              isExpanded: true,
              underline:  const SizedBox(),
              hint:  Text(widget. text),
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
                 
                   Provider.of<EmployesDetailsControl>(context, listen: false).selectdestrict(valuechoose!);
        

                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
