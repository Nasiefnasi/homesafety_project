// import 'package:hive/hive.dart';

// part 'user_model.g.dart';

// @HiveType(typeId: 0)
// class UserModel {
//   @HiveField(0)
//   String email;

//   @HiveField(1)
//   String password;

// ignore_for_file: camel_case_types, unused_local_variable

//   UserModel(this.email, this.password);
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared_preferences extends ChangeNotifier {
  String ?getemail ;
 String? getpassword;
  void setdetaildatabse(
    String emaildata,
    String passworddata,
  ) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("emailKey", emaildata.toString());
    await pref.setString("passwordKey", passworddata.toString());

    notifyListeners();
  }

  void getdetailsdatabase() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString("emailKey");
    final savedPassword = prefs.getString("passwordKey");

    if(savedEmail != null && savedPassword != null){
       getemail = savedEmail.toString();
       getpassword = savedPassword.toString();
    }
  }
}
