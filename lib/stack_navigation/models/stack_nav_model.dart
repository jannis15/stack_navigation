import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stack_navigation/utils/keep_alive_wrapper.dart';

class StackNavModel {
  final Widget page;
  final String name;
  final FutureOr<bool> Function()? onPop;

  StackNavModel({
    required Widget page,
    required this.name,
    this.onPop,
  }) : page = KeepAliveWrapper(child: page);
}
