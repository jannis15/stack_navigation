import 'package:flutter/material.dart';
import 'package:stack_navigation/tab_navigation/controllers/tab_nav_controller.dart';
import 'package:stack_navigation/tab_navigation/views/tab_nav_view.dart';

class ExampleMainScreen extends StatefulWidget {
  final TabNavController tabController;

  const ExampleMainScreen({super.key, required this.tabController});

  @override
  State<ExampleMainScreen> createState() => _ExampleMainScreenState();
}

class _ExampleMainScreenState extends State<ExampleMainScreen> {
  late final TabNavController _tabController = widget.tabController;

  void _updateState() => setState(() {});

  @override
  void initState() {
    _tabController.addListener(_updateState);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.removeListener(_updateState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabNavView(controller: _tabController),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabController.index,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Tab 1'),
          BottomNavigationBarItem(icon: Icon(Icons.time_to_leave), label: 'Tab 2'),
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'Tab 3'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Tab 4'),
        ],
        onTap: _tabController.changeTab,
      ),
    );
  }
}
