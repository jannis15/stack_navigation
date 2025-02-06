import 'package:stack_navigation/stack_navigation/controllers/stack_nav_controller.dart';
import 'package:stack_navigation/tab_navigation/controllers/tab_nav_controller.dart';

class ExampleNavigationState {
  final List<StackNavController> stackControllers;
  final TabNavController tabController;

  ExampleNavigationState({
    required this.stackControllers,
    required this.tabController,
  });
}
