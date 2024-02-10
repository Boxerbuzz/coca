/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';

import '../../../../../coca.dart';
import 'project_list_item.dart';
import 'project_list_item_header.dart';

class ProjectListGroupItem extends BaseStatelessWidget {
  const ProjectListGroupItem({super.key, required this.data});
  final AppFlowyGroupData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: styles(context).insets.sm),
      child: Column(
        children: [
          ProjectListItemHeader(data: data),
          const Gap(16),
          const ProjectListItem(null),
          //...data.items.map((e) => ProjectListItem(e)),
        ],
      ),
    );
  }
}
