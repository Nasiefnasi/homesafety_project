// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homesefty/controller/getxemployessprofile/heroemployes.dart';
import 'package:homesefty/core/size/colors&size.dart';
import 'package:homesefty/core/textFromFild/textFormfiledWidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EmployeProfilePage extends StatefulWidget {
  const EmployeProfilePage({super.key});

  @override
  State<EmployeProfilePage> createState() => _EmployeProfilePageState();
}

class _EmployeProfilePageState extends State<EmployeProfilePage> {
  final formkey = GlobalKey<FormState>();


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
                          // ? const Center(child: Text('Select mage'))
                         ? Image.network( "https://www.biiainsurance.com/wp-content/uploads/2015/05/no-image.jpg")
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
                    keybord: TextInputType.name,
                    contros: employcontrl.name,
                    hinttext: 'Full Name',
                  ),
                  DetailsProfilepage(
                    keybord: TextInputType.number,
                    contros: employcontrl.phone,
                    hinttext: 'Phone Number',
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ChosseOptionPage(),
                      DetailsProfilepage(
                        contros: employcontrl.ages,
                        widths: _mediaqury.width * 0.4,
                        hinttext: 'Age',
                      ),
                    ],
                  ),

                  DetailsProfilepage(
                    keybord: TextInputType.streetAddress,
                    contros: employcontrl.address,
                    hinttext: 'Address ',
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
                                  Provider.of<EmployesDetailsControl>(context,
                                          listen: false)
                                      .getworklist(favorite);
                                

                                

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
                                       
                                          Text(
                                            favorite['name'],
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),

                                          const SizedBox(
                                            width: 5,
                                          ),
                                          
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  favorite['ischecked'] =
                                                      !favorite['ischecked'];
                                                  if (favorite['ischecked']) {
                                              
                                                  }
                                               
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
                    keybord: TextInputType.text,
                    contros: employcontrl.experience,
                    hinttext: 'Experience',
                  ),
                  const DistrictSelectionWidget(),

                  DetailsProfilepage(
                    keybord: TextInputType.streetAddress,
                    contros: employcontrl.state,
                    hinttext: 'State',
                  ),

                  hight30,

                  SizedBox(
                    width: _mediaqury.width * 0.9,
                    height: _mediaqury.height * 0.05,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          addButton();
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

  void addButton() async {
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
      Get.snackbar("Successfull", 'Ditails');
    }
  }

  Column Employeeswork() {
    return Column(
        children: categories.map(
      (favoritevalu) {
        return CheckboxListTile(
          checkColor: Colors.amber,
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

class DistrictSelectionWidget extends StatefulWidget {
  const DistrictSelectionWidget({
    super.key,
  });

  @override
  State<DistrictSelectionWidget> createState() =>
      _DistrictSelectionWidgetState();
}

class _DistrictSelectionWidgetState extends State<DistrictSelectionWidget> {
  String? valuechoose;

  String? sex;
  List<String> listitem = [
    'Alappuzha',
    'Ernakulam',
    'Kozhikode',
    'Palakkad',
    'Kollam',
    'Kannur',
    'Kasaragod',
    'Idukki',
    'Kottayam',
    'Thrissur',
    'Pathanamthitta',
    'Malappuram',
    'Wayanad',
    'Thiruvananthapuram',
  ];
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
              onChanged: (Newvalue) {
                setState(() {
                  valuechoose = Newvalue;

                  Provider.of<EmployesDetailsControl>(context, listen: false)
                      .selectdestrict(valuechoose!);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
