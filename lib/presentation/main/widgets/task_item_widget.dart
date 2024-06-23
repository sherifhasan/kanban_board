import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/application/features/main/tasks_cubit.dart';
import 'package:kanban_board/domain/models/task.dart';

import 'dialogs.dart';

class TaskItemWidget extends StatefulWidget {
  final Task task;
  final BuildContext context;

  const TaskItemWidget({
    super.key,
    required this.task,
    required this.context,
  });

  @override
  TaskItemWidgetState createState() => TaskItemWidgetState();
}

class TaskItemWidgetState extends State<TaskItemWidget> {
  late Stopwatch _stopwatch;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
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
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(child: Text(widget.task.content)),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDeleteTaskDialog(widget.context, widget.task.id);
            },
          ),
          IconButton(
            icon: widget.task.isTiming
                ? const Icon(Icons.stop)
                : const Icon(Icons.play_arrow),
            onPressed: () {
              if (widget.task.isTiming) {
                setState(() {
                  _stopwatch.stop();
                });
                context
                    .read<TasksCubit>()
                    .stopTimer(widget.task.id, _stopwatch.elapsed.inSeconds);
                _stopwatch.reset();
              } else {
                setState(() {
                  _stopwatch.start();
                });
                context.read<TasksCubit>().startTimer(widget.task.id);
              }
            },
          ),
          if (widget.task.isTiming)
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: StreamBuilder<int>(
                stream: _stopwatchStream(),
                builder: (context, snapshot) {
                  return Text(
                      '${((snapshot.data ?? widget.task.timeSpent) / 60).toStringAsFixed(2)} min',
                      style: const TextStyle(fontSize: 14));
                },
              ),
            ),
        ],
      ),
    );
  }
}
