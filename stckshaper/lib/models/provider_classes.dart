import 'package:flutter/material.dart';

class NavIndex extends ChangeNotifier {
  int _tabIndex = 0;

  void changeIndex(int newIndex) {
    _tabIndex = newIndex;
    notifyListeners();
  }

  int get tabIndex => _tabIndex;
}
