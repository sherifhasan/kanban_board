import 'package:flutter/material.dart';
import 'package:flutter_boardview/board_item.dart';
import 'package:kanban_board/domain/models/task.dart';
import 'package:kanban_board/presentation/main/widgets/task_details_widget.dart';
import 'task_item_widget.dart';

BoardItem buildBoardItem({
  required Task task,
  required void Function(int?, int?, int?, int?) onDropItem,
  required BuildContext context,
}) {
  return BoardItem(
    draggable: true,
    onStartDragItem: (int? listIndex, int? itemIndex, BoardItemState? state) {},
    onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
        int? oldItemIndex, BoardItemState? state) {
      onDropItem(listIndex, itemIndex, oldListIndex, oldItemIndex);
    },
    onTapItem: (int? listIndex, int? itemIndex, BoardItemState? state) async {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return Dialog(
            insetPadding: const EdgeInsets.all(16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Align(
                    alignment: Alignment.topCenter,
                    child: Text('Task Details')),
                Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 250,
                    child: TaskDetailsWidget(task: task)),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    child: const Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
    item: TaskItemWidget(task: task, context: context),
  );
}
