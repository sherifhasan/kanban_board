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
  late Stopwatch _stopwatch;

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController(text: widget.task.content);
    _stopwatch = Stopwatch();
    context.read<TasksCubit>().loadComments(widget.task.id);
    if (widget.task.isTiming) {
      _stopwatch.start();
    }
  }

  Stream<int> _stopwatchStream() async* {
    int initialTime = widget.task.timeSpent;
    yield initialTime;
    while (_stopwatch.isRunning) {
      await Future.delayed(const Duration(seconds: 1));
      yield initialTime + _stopwatch.elapsed.inSeconds;
    }
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
              const Divider(),
              Row(
                children: [
                  if (!updatedTask.isTiming)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _stopwatch.start();
                        });
                        context.read<TasksCubit>().startTimer(updatedTask.id);
                      },
                      child: const Text('Start Timer'),
                    )
                  else
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _stopwatch.stop();
                        });
                        context.read<TasksCubit>().stopTimer(
                            updatedTask.id, _stopwatch.elapsed.inSeconds);
                        _stopwatch.reset();
                      },
                      child: const Text('Stop Timer'),
                    ),
                  if (updatedTask.isTiming)
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: StreamBuilder<int>(
                        stream: _stopwatchStream(),
                        builder: (context, snapshot) {
                          return Text(
                              'Time: ${snapshot.data ?? updatedTask.timeSpent}s',
                              style: const TextStyle(fontSize: 14));
                        },
                      ),
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
