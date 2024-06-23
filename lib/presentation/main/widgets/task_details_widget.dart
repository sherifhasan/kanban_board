import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/application/features/main/tasks_cubit.dart';
import 'package:kanban_board/domain/models/task.dart';

class TaskDetailsWidget extends StatefulWidget {
  final Task task;

  const TaskDetailsWidget({super.key, required this.task});

  @override
  TaskDetailsWidgetState createState() => TaskDetailsWidgetState();
}

class TaskDetailsWidgetState extends State<TaskDetailsWidget> {
  final TextEditingController _commentController = TextEditingController();
  late TextEditingController _taskController;

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController(text: widget.task.content);

    context.read<TasksCubit>().loadComments(widget.task.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TaskState>(
      builder: (context, state) {
        final updatedTask = state.maybeWhen(
          loaded: (tasks) => tasks.firstWhere(
              (task) => task.id == widget.task.id,
              orElse: () => widget.task),
          orElse: () => widget.task,
        );

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _taskController,
                decoration: const InputDecoration(labelText: 'Task Content'),
                onSubmitted: (value) {
                  context
                      .read<TasksCubit>()
                      .updateTask(updatedTask.copyWith(content: value));
                },
              ),
              const SizedBox(height: 8),
              const Text('Comments',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 200.0, // Adjust this value as needed
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: updatedTask.comments
                        .map((comment) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(comment.content),
                            ))
                        .toList(),
                  ),
                ),
              ),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration:
                          const InputDecoration(labelText: 'Add a comment'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      final content = _commentController.text;
                      if (content.isNotEmpty) {
                        context
                            .read<TasksCubit>()
                            .addComment(updatedTask.id, content);
                        _commentController.clear();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
