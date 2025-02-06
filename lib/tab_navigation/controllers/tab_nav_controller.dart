import 'package:flutter/material.dart';

class TabNavController extends ChangeNotifier {
  late int _index;

  TabNavController({required int initialIndex}) {
    _index = initialIndex;
  }

  int get index => _index;

  void changeTab(int index) {
    _index = index;
    notifyListeners();
  }
}
