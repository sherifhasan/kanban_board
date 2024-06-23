import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/application/features/tasks/tasks_cubit.dart';
import 'package:kanban_board/domain/models/task.dart';

void showAddTaskDialog(BuildContext context) {
  final TextEditingController taskController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add New Task'),
        content: TextField(
          controller: taskController,
          decoration: const InputDecoration(hintText: 'Enter task content'),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Add'),
            onPressed: () {
              final content = taskController.text;
              if (content.isNotEmpty) {
                final tasksCubit = context.read<TasksCubit>();
                tasksCubit.addTask(content);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}

void showUpdateTaskDialog(BuildContext context, Task task) {
  final TextEditingController taskController = TextEditingController();
  taskController.text = task.content;
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text('Update Task'),
        content: TextField(
          controller: taskController,
          decoration: const InputDecoration(hintText: 'Enter task content'),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Update'),
            onPressed: () {
              final content = taskController.text;
              if (content.isNotEmpty) {
                final tasksCubit = context.read<TasksCubit>();
                tasksCubit.updateTask(task.copyWith(content: content));
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}

void showDeleteTaskDialog(BuildContext context, String taskId) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Delete'),
            onPressed: () {
              final tasksCubit = context.read<TasksCubit>();
              tasksCubit.deleteTask(taskId);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
