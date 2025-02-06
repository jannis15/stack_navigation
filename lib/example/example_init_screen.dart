import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_navigation/example/screens/example_main_screen.dart';
import 'package:stack_navigation/example/screens/example_list_screen.dart';
import 'package:stack_navigation/example/providers/example_navigation_cubit.dart';
import 'package:stack_navigation/example/states/example_navigation_state.dart';
import 'package:stack_navigation/stack_navigation/controllers/stack_nav_controller.dart';
import 'package:stack_navigation/stack_navigation/models/stack_nav_model.dart';
import 'package:stack_navigation/stack_navigation/views/stack_nav_view.dart';
import 'package:stack_navigation/tab_navigation/controllers/tab_nav_controller.dart';
import 'package:stack_navigation/tab_navigation/models/tab_nav_model.dart';

class ExampleInitScreen extends StatelessWidget {
  const ExampleInitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExampleNavigationCubit>(
      create: (context) {
        final stackControllers = [
          StackNavController(
            initialPage: StackNavModel(
              page: const ExampleListScreen(),
              name: 'Page 1',
            ),
          ),
          StackNavController(
            initialPage: StackNavModel(
              page: const ExampleListScreen(),
              name: 'Page 1',
            ),
          ),
          StackNavController(
            initialPage: StackNavModel(
              page: const ExampleListScreen(),
              name: 'Page 1',
            ),
          ),
          StackNavController(
            initialPage: StackNavModel(
              page: const ExampleListScreen(),
              name: 'Page 1',
            ),
          ),
        ];
        return ExampleNavigationCubit(
          ExampleNavigationState(
            stackControllers: stackControllers,
            tabController: TabNavController(
              list: stackControllers.map((controller) => TabNavModel(page: StackNavView(controller: controller))).toList(),
              initialIndex: 0,
            ),
          ),
        );
      },
      child: BlocBuilder<ExampleNavigationCubit, ExampleNavigationState>(
        builder: (context, state) => ExampleMainScreen(tabController: state.tabController),
      ),
    );
  }
}
