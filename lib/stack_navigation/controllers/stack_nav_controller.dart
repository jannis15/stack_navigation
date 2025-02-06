import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stack_navigation/stack_navigation/models/stack_nav_model.dart';

class StackNavController extends ChangeNotifier {
  final List<StackNavModel> _stack = <StackNavModel>[];

  StackNavController({StackNavModel? initialPage}) {
    if (initialPage != null) {
      _stack.add(initialPage);
    }
  }

  List<StackNavModel> get stack => List.unmodifiable(_stack);

  void push(StackNavModel entry) {
    _stack.add(entry);
    notifyListeners();
  }

  Future<bool> pop() async {
    final lastEntry = _stack.lastOrNull;
    if (lastEntry != null) {
      if (lastEntry.onPop != null) {
        final popResult = await lastEntry.onPop!();
        if (!popResult) return false;
      }
    } else {
      return false;
    }
    _stack.removeLast();
    notifyListeners();
    return true;
  }

  Future<void> popUntilIndex(int index) async {
    while (_stack.length - 1 > index) {
      final didPop = await pop();
      if (!didPop) return;
    }
  }
}
