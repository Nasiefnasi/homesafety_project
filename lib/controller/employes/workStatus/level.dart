import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Level extends ChangeNotifier{
  FirebaseFirestore db= FirebaseFirestore.instance;
  FirebaseAuth auth =FirebaseAuth.instance;
  String ? emploId;
  String ? userId;
  String ? startLevel;
  String? endLevel;


  

}