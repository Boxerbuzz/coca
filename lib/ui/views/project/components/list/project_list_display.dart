/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../../coca.dart';
import 'project_list_group_item.dart';

class ProjectListDisplay extends BaseStatelessWidget {
  const ProjectListDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(styles(context).insets.xxs),
        Expanded(
          child: CustomScrollViewWithFade(
            child: Column(
              children: [
                ...[todo, backlog, progress, completed, canceled]
                    .map((e) => ProjectListGroupItem(key: ValueKey(e), data: e))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
