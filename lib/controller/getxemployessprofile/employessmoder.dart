import 'package:cloud_firestore/cloud_firestore.dart';

class EmployesDetailsModel {
  String? id;
  String? imageUrl;
  String? fullname;
  String? phonenumber;
  String? sex;
  String? age;
  String? address;
  String? experience;
  String? district;
  String? state;
  EmployesDetailsModel({
    this.id,
    required this.imageUrl,
    required this.fullname,
    required this.phonenumber,
    required this.sex,
    required this.age,
    required this.address,
    required this.experience,
    required this.district,
    required this.state,
  });
  factory EmployesDetailsModel.fromMap(DocumentSnapshot map) {
    return EmployesDetailsModel(
        imageUrl: map['imageUrl'],
        fullname: map['fullname'],
        phonenumber: map['phonenumber'],
        sex: map['sex'],
        age: map['age'],
        address: map['address'],
        experience: map['experience'],
        district: map['district'],
        state: map['state']);
  }
  Map<String, dynamic> tomap() {
    return {
      "imageUrl": imageUrl,
      'fullname': fullname,
     
      'phonenumber': phonenumber,
       'sex': sex,
        'age': age,
         'address': address,
      'experience': experience,
      'district': district,
      'state': state
    };
  }
}
