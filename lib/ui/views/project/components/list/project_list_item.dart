/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../../coca.dart';
import '../../../../widgets/buttons/custom_app_button.dart';
import '../board/project_board_display.dart';
import 'project_item_cell_wrapper.dart';
import 'project_list_item_title.dart';

class ProjectListItem extends BaseStatelessWidget {
  final TaskModel? task;
  final double? parentWidth;
  final bool isSelected;
  final bool showDividers;

  const ProjectListItem(this.task, {super.key, this.parentWidth, this.isSelected = false, this.showDividers = true});

  bool get headerMode => task == null;

  @override
  Widget build(BuildContext context) {
    Color bgColor = headerMode ? HexColor.fromHex('#F8F8FB') : styles(context).theme.white;
    if (isSelected) {
      bgColor = styles(context).theme.grey2.withOpacity(.35);
    }

    double width = parentWidth ?? context.widthPx;
    int colCount = 1;
    if (width > 400) colCount = 2;
    if (width > 600) colCount = 3;
    if (width > 1000) colCount = 4;
    if (width > 1300) colCount = 5;

    TextStyle textStyle =
        !headerMode ? styles(context).text.t2 : styles(context).text.p.textColor(styles(context).theme.grey4);

    Widget row(String v) => Text(v, style: textStyle, maxLines: 1, softWrap: false, overflow: TextOverflow.fade);

    Widget btn = CustomAppButton(
      onPressed: headerMode ? null : () => {},
      bgColor: bgColor,
      radius: 0,
      padding: EdgeInsets.zero,
      child: Stack(
        children: <Widget>[
          /// DIVIDER - Bottom
          if (!headerMode && showDividers) ...{
            Align(alignment: Alignment.bottomLeft, child: Container(height: 1, color: styles(context).theme.silver)),
          },

          Row(
            children: <Widget>[
              (headerMode ? row("Task Name") : ProjectListItemTitle(task!))
                  .constrained(minWidth: 300)
                  .expanded(flex: 48 * 100),
              ProjectItemCellWrapper(
                  isVisible: colCount > 1,
                  flex: 10,
                  child: headerMode ? row("Assigned to") : CustomAvatarPile(users: task?.assignee ?? [], size: 24)),
              ProjectItemCellWrapper(
                  flex: 11, isVisible: colCount > 2, child: row(headerMode ? "Due date" : task!.date)),
            ],
          ).padding(vertical: styles(context).insets.sm, horizontal: styles(context).insets.sm),
        ],
      ),
    );
    return btn;
  }
}
