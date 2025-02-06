import 'package:flutter/material.dart';

extension StateExtension on State {
  ColorScheme get colorScheme => Theme.of(context).colorScheme;

  TextTheme get textTheme => Theme.of(context).textTheme;
}
