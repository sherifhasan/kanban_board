import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_board/application/features/tasks/tasks_cubit.dart';
import 'package:kanban_board/domain/models/task.dart';
import 'package:flutter_boardview/boardview.dart';
import 'package:flutter_boardview/boardview_controller.dart';
import 'package:kanban_board/presentation/main/widgets/board_list_widget.dart';
import 'package:kanban_board/presentation/main/widgets/dialogs.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final BoardViewController _boardViewController = BoardViewController();

  @override
  void initState() {
    super.initState();
    context.read<TasksCubit>().loadTasks('');
  }

  void _handleDropList(int? listIndex, int? oldListIndex) {
    // Implement logic if needed
  }

  void _handleDropItem(
      int? listIndex, int? itemIndex, int? oldListIndex, int? oldItemIndex) {
    final tasksCubit = context.read<TasksCubit>();
    final currentTasks = tasksCubit.state.maybeWhen(
      loaded: (tasks) => tasks,
      orElse: () => <Task>[],
    );

    final task = currentTasks[oldItemIndex!];
    final newStatus = _getTaskStatusFromListIndex(listIndex);
    tasksCubit.moveTask(task.copyWith(status: newStatus), newStatus);
  }

  TaskStatus _getTaskStatusFromListIndex(int? listIndex) {
    switch (listIndex) {
      case 0:
        return TaskStatus.toDo;
      case 1:
        return TaskStatus.inProgress;
      case 2:
        return TaskStatus.done;
      default:
        throw Exception('Unknown list index: $listIndex');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanban Board'),
      ),
      body: BlocBuilder<TasksCubit, TaskState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('No tasks loaded')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (tasks) {
              final todoTasks = tasks
                  .where((task) => task.status == TaskStatus.toDo)
                  .toList();
              final inProgressTasks = tasks
                  .where((task) => task.status == TaskStatus.inProgress)
                  .toList();
              final doneTasks = tasks
                  .where((task) => task.status == TaskStatus.done)
                  .toList();

              return BoardView(
                lists: [
                  buildBoardList(
                    name: 'TODO',
                    tasks: todoTasks,
                    onDropList: _handleDropList,
                    onDropItem: _handleDropItem,
                    context: context,
                  ),
                  buildBoardList(
                    name: 'IN PROGRESS',
                    tasks: inProgressTasks,
                    onDropList: _handleDropList,
                    onDropItem: _handleDropItem,
                    context: context,
                  ),
                  buildBoardList(
                    name: 'DONE',
                    tasks: doneTasks,
                    onDropList: _handleDropList,
                    onDropItem: _handleDropItem,
                    context: context,
                  ),
                ],
                boardViewController: _boardViewController,
              );
            },
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
