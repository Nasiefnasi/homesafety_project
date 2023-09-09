import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  String? id;
  String? imageUrl;
  String? fullname;
  String? address;
  String? phonenumber;
  String? email;
  String? district;
  String? state;

  UserDetails({
    this.id,
    required this.imageUrl,
    required this.fullname,
    required this.address,
    required this.phonenumber,
    required this.email,
    required this.district,
    required this.state,
  });
  factory UserDetails.fremMap(DocumentSnapshot map) {
    return UserDetails(
      id: map['id'],
        imageUrl: map['imageUrl'],
        fullname: map['fullname'],
        address: map['adress'],
        phonenumber: map['phone'],
        email: map['email'],
        district: map['district'],
        state: map['state']);
  }
  Map<String, dynamic> tomap() {
    return {
      'id':id,
      "imageUrl": imageUrl,
      'fullname': fullname,
      'address': address,
      'phonenumber': phonenumber,
      'email': email,
      'district': district,
      'state': state
    };
  }

//  static UserDetails fromjson(Map<String, dynamic> json) => UserDetails(
//       imageUrl: json['imageUrl'],
//       fullname: json['fullname'],
//       address: json['adress'],
//       phonenumber: json['phone'],
//       email: json['email'],
//       district: json['district'],
//       state: json['state']);
}
