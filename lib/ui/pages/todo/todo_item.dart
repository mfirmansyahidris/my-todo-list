import 'package:flutter/material.dart';
import 'package:mtodolist/core/core.dart';

import '../../ui.dart';

class TodoItem extends StatelessWidget {
  final TodoData todoData;
  final VoidCallback? onTap;

  const TodoItem({Key? key, required this.todoData, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String avatar = "";
    try {
      avatar = todoData.note![0].toUpperCase();
    } catch (e) {
      debugPrint(e.toString());
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Dimens.space10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: Dimens.iconM,
              backgroundColor: todoData.isComplete ?? false ? Palette.textDisable : null,
              child: Text(avatar, style: TextStyles.h3.copyWith(color: Palette.white)),
            ),
            SpacerH(
              value: Dimens.space10,
            ),
            Expanded(
              child: Container(
                constraints: BoxConstraints(minHeight: 2 * Dimens.iconM),
                alignment: Alignment.centerLeft,
                child: Text(
                  todoData.note ?? "",
                  style: TextStyles.body1.copyWith(
                    color: todoData.isComplete ?? false ? Palette.textDisable : null,
                    decoration: todoData.isComplete ?? false ? TextDecoration.lineThrough : null
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
