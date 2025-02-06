import 'package:flutter/material.dart';
import 'package:stack_navigation/utils/iterable_widget_extension.dart';

class ColumnSeparated extends Column {
  ColumnSeparated({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    required List<Widget> children,
    required Widget separator,
  }) : super(children: children.separated(separator: separator));
}
