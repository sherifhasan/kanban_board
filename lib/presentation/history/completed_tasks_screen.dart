import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/application/features/history/completed_tasks_cubit.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Tasks History'),
      ),
      body: BlocBuilder<CompletedTasksCubit, CompletedTasksState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('No completed tasks')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (tasks) => ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task.content),
                  subtitle: Text(
                      'Completed at: ${(task.timeSpent / 60).toStringAsFixed(2)} min'),
                );
              },
            ),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}
