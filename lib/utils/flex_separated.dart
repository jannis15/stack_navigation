import 'package:flutter/material.dart';
import 'package:stack_navigation/utils/iterable_widget_extension.dart';

class FlexSeparated extends Flex {
  FlexSeparated({
    super.key,
    required super.direction,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.clipBehavior,
    required List<Widget> children,
    required Widget separator,
  }) : super(children: children.separated(separator: separator));
}
