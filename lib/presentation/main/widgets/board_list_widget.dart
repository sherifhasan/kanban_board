import 'package:flutter/material.dart';
import 'package:flutter_boardview/board_item.dart';
import 'package:flutter_boardview/board_list.dart';
import 'package:kanban_board/domain/models/task.dart';

import 'board_item_widget.dart';

BoardList buildBoardList({
  required String name,
  required List<Task> tasks,
  required void Function(int?, int?) onDropList,
  required void Function(int?, int?, int?, int?) onDropItem,
  required BuildContext context,
}) {
  List<BoardItem> items = tasks.map((task) {
    return buildBoardItem(task: task, onDropItem: onDropItem, context: context);
  }).toList();

  return BoardList(
    draggable: true,
    onDropList: onDropList,
    header: [
      Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.w800)),
            const SizedBox(width: 8),
            Text('${tasks.length}', style: const TextStyle(fontWeight: FontWeight.w800)),
          ],
        ),
      ),
    ],
    items: items,
  );
}
