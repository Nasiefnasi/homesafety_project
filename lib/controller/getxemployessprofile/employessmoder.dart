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
  
  List<Map<dynamic, dynamic>> work;
  // List< String> work;
  String? state;
  EmployesDetailsModel({
    this.id,
    required this.imageUrl,
    required this.fullname,
    required this.phonenumber,
    required this.sex,
    required this.age,
    required this.work,
    required this.address,
    required this.experience,
    required this.district,
    required this.state,
    
  });
  factory EmployesDetailsModel.fromMap(DocumentSnapshot map) {
    return EmployesDetailsModel(
        id: map['id'],
        imageUrl: map['imageUrl'],
        fullname: map['fullname'],
        phonenumber: map['phonenumber'],
        work: map['works'],
        sex: map['sex'],
        age: map['age'],
        address: map['address'],
        experience: map['experience'],
        district: map['district'],
        state: map['state'],
        );
  }
  Map<String, dynamic> ttomap() {
    return {
      'id':id,
      "imageUrl": imageUrl,
      'fullname': fullname,
      'works': work,
      'phonenumber': phonenumber,
      'sex': sex,
      'age': age,
      'address': address,
      'experience': experience,
      'district': district,
      'state': state,
      

    };
  }
}
