import 'package:collection/collection.dart';

extension IterableWidgetExtension<Widget> on Iterable<Widget> {
  List<Widget> separated({required Widget separator}) =>
      mapIndexed((index, element) => [element, if (index < length - 1) separator]).expand((element) => element).toList();
}
