import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:stack_navigation/stack_navigation/controllers/stack_nav_controller.dart';

class StackNavView extends StatefulWidget {
  final StackNavController controller;

  const StackNavView({super.key, required this.controller});

  @override
  State<StackNavView> createState() => _StackNavViewState();
}

class _StackNavViewState extends State<StackNavView> {
  late final StackNavController _controller = widget.controller;

  void _updateState() => setState(() {});

  @override
  void initState() {
    _controller.addListener(_updateState);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_updateState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildPage({required Widget page, required bool visible}) =>
        Visibility(
          maintainState: true,
          visible: visible,
          child: page,
        );

    return Stack(
      children: _controller.stack
          .mapIndexed(
            (index, navEntry) =>
            buildPage(
              page: navEntry.page,
              visible: index == _controller.stack.length - 1,
            ),
      )
          .toList(),
    );
  }
}
