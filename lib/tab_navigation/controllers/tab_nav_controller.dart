import 'package:flutter/material.dart';
import 'package:stack_navigation/tab_navigation/models/tab_nav_model.dart';

class TabNavController extends ChangeNotifier {
  late final List<TabNavModel> _list;
  late int _index;

  TabNavController({
    required List<TabNavModel> list,
    required int initialIndex,
  }) {
    _list = list;
    _index = initialIndex;
  }

  TabNavModel get currentTab => _list[_index];

  List<Widget> get tabs => _list.map((tab) => tab.page).toList();

  int get index => _index;

  void changeTab(int index) {
    _index = index;
    notifyListeners();
  }
}
