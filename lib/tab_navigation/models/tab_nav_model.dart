import 'package:flutter/material.dart';
import 'package:stack_navigation/utils/keep_alive_wrapper.dart';

class TabNavModel {
  final Widget page;

  TabNavModel({
    required Widget page,
  }) : page = KeepAliveWrapper(child: page);
}
