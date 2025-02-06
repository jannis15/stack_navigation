import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_navigation/example/providers/example_navigation_cubit.dart';
import 'package:stack_navigation/example/states/example_navigation_state.dart';
import 'package:stack_navigation/stack_navigation/models/stack_nav_model.dart';
import 'package:stack_navigation/stack_navigation/views/stack_nav_trail.dart';
import 'package:stack_navigation/utils/column_separated.dart';

class _Item {
  ValueNotifier<int> count;

  void incrementCount() => count.value++;

  _Item({required int count}) : count = ValueNotifier<int>(count);
}

class _ItemCard extends StatelessWidget {
  final _Item item;
  final int index;

  const _ItemCard({
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: item.incrementCount,
        child: Center(
          child: Semantics(
            child: ValueListenableBuilder<int>(
              valueListenable: item.count,
              builder: (BuildContext context, int value, Widget? child) => Text('Item ${index + 1} - Count: ${item.count.value}'),
            ),
          ),
        ),
      ),
    );
  }
}

class ExampleListScreen extends StatefulWidget {
  const ExampleListScreen({super.key});

  @override
  State<ExampleListScreen> createState() => _ExampleListScreenState();
}

class _ExampleListScreenState extends State<ExampleListScreen> {
  final List<_Item> _items = List.generate(5000, (index) => _Item(count: 0));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExampleNavigationCubit, ExampleNavigationState>(
      builder: (context, state) {
        final int nextTabIndex = (state.tabController.index + 1) % state.stackControllers.length;
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(10),
            child: ColumnSeparated(
              separator: SizedBox(height: 10),
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                StackNavTrail(
                  controller: state.stackControllers[state.tabController.index],
                ),
                Expanded(
                  child: ListView.builder(
                    itemExtent: 200,
                    itemCount: _items.length,
                    itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _ItemCard(item: _items[index], index: index),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              state.stackControllers[nextTabIndex].push(
                StackNavModel(
                  page: ExampleListScreen(),
                  name: 'Page ${state.stackControllers[nextTabIndex].stack.length + 1}',
                ),
              );
              state.tabController.changeTab(nextTabIndex);
            },
            label: Text('Push Page & Switch to Tab ${nextTabIndex + 1}'),
          ),
        );
      },
    );
  }
}
