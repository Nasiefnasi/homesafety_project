import 'package:flutter/material.dart';

class frrrating extends ChangeNotifier{

  List<int>  lessvalue=[];
  datalis(dynamic data){
    for (int i = 0; i < data; i++) {
                        if (i < 10) {
                          lessvalue.add(i);
                        } else {
                          return null;

                        }
                        notifyListeners();
                      }

  }
}