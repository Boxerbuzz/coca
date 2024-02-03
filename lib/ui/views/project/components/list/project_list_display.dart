/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/ui/widgets/kanban/appyflow.dart';
import 'package:flutter/material.dart';

class ProjectListDisplay extends StatefulWidget {
  const ProjectListDisplay({super.key});

  @override
  State<ProjectListDisplay> createState() => _ProjectListDisplayState();
}

class _ProjectListDisplayState extends State<ProjectListDisplay> {
  final AppFlowyBoardController boardData = AppFlowyBoardController();

  @override
  void initState() {
    final column = AppFlowyGroupData(
      id: "1",
      name: "1",
      items: [
        TextItem("a"),
        TextItem("b"),
        TextItem("c"),
        TextItem("d"),
      ],
    );

    boardData.addGroup(column);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppFlowyBoard(
      scrollController: ScrollController(debugLabel: 'single_list'),
      controller: boardData,
      cardBuilder: (context, column, columnItem) {
        return _RowWidget(item: columnItem as TextItem, key: ObjectKey(columnItem));
      },
    );
  }
}

class _RowWidget extends StatelessWidget {
  final TextItem item;
  const _RowWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ObjectKey(item),
      height: 60,
      color: Colors.green,
      child: Center(child: Text(item.s)),
    );
  }
}

class TextItem extends AppFlowyGroupItem {
  final String s;

  TextItem(this.s);

  @override
  String get id => s;
}
