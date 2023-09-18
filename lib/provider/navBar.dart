// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NavBar extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int newindex) {
    _pageIndex = newindex;
    notifyListeners();
  }
}
class Adminside extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int newindex) {
    _pageIndex = newindex;
    notifyListeners();
  }
}
