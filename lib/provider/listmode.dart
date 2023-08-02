// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class hello extends ChangeNotifier{
//    String? valuechoose;
//   List<String> listitem = ["male", "Fmale", "gender"];
//    bootom(){
//     return
//   Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         width: 180,
//         child: Card(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//           shadowColor: Colors.blue,
//           elevation: 5,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 10, right: 10),
//             child: DropdownButton(
//               isExpanded: true,
//               underline: const SizedBox(),
//               hint: const Text('Select Option '),
//               value: valuechoose,
//               items: listitem.map((valueitem) {
//                 return DropdownMenuItem(
//                   value: valueitem,
//                   child: Text(valueitem),
//                 );
//               }).toList(),
//               // ignore: non_constant_identifier_names
//               onChanged: (Newvalue) {
               
//                   valuechoose = Newvalue;
//                   notifyListeners();
              
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
   
// }
import 'package:flutter/material.dart';

class MyProviderClass extends ChangeNotifier {
  String _selectedValue = '';

  String get selectedValue => _selectedValue;

  void updateSelectedValue(String newValue) {
    _selectedValue = newValue;
    notifyListeners();
  }
}