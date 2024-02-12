/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../../coca.dart';
import 'project_list_item.dart';
import 'project_list_item_header.dart';

class ProjectListGroupItem extends BaseStatelessWidget {
  const ProjectListGroupItem({super.key, required this.data});
  final ListDisplayModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: styles(context).insets.sm),
      margin: EdgeInsets.only(bottom: styles(context).insets.sm),
      child: Column(
        children: [
          ProjectListItemHeader(data: data),
          const Gap(16),
          const ProjectListItem(null),
          ...data.projects.map((e) => ProjectListItem(e)),
        ],
      ),
    );
  }
}
