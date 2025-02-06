import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:stack_navigation/stack_navigation/controllers/stack_nav_controller.dart';
import 'package:stack_navigation/utils/state_extension.dart';

import '../../utils/flex_separated.dart';

class StackNavTrail extends StatefulWidget {
  final StackNavController controller;

  const StackNavTrail({super.key, required this.controller});

  @override
  State<StackNavTrail> createState() => _StackNavTrailState();
}

class _StackNavTrailState extends State<StackNavTrail> {
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: FlexSeparated(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        separator: SizedBox(
          width: 16,
          child: Icon(
            Icons.chevron_right,
            size: 8,
            color: colorScheme.outline,
          ),
        ),
        children: _controller.stack
            .mapIndexed(
              (index, navEntry) => InkWell(
                onTap: navEntry == _controller.stack.lastOrNull ? null : () => _controller.popUntilIndex(index),
                child: Text(
                  navEntry.name,
                  style: textTheme.labelSmall?.copyWith(
                    color: navEntry == _controller.stack.lastOrNull ? colorScheme.onSurface : colorScheme.outline,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
