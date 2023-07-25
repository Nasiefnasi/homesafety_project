import 'package:flutter/material.dart';

class NavBar extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int newindex) {
    _pageIndex = newindex;
    notifyListeners();
  }
}
