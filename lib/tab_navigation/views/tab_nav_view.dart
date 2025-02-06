import 'package:flutter/material.dart';
import 'package:stack_navigation/tab_navigation/controllers/tab_nav_controller.dart';

class TabNavView extends StatefulWidget {
  final TabNavController controller;

  const TabNavView({super.key, required this.controller});

  @override
  State<TabNavView> createState() => _TabNavViewState();
}

class _TabNavViewState extends State<TabNavView> {
  late final TabNavController _controller = widget.controller;
  late final PageController _pageController = PageController(initialPage: _controller.index);

  void _updateState() => _pageController.animateToPage(
        _controller.index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );

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
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: _controller.tabs,
    );
  }
}
