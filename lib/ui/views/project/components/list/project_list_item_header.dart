/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../../coca.dart';

class ProjectListItemHeader extends BaseStatelessWidget {
  const ProjectListItemHeader({super.key, required this.data});
  final ListDisplayModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(data.name, style: styles(context).text.t2),
        Gap(styles(context).insets.xs),
        Container(
            height: 22,
            width: 28,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: styles(context).theme.grey2),
            child: Center(child: Text('${data.projects.length}', style: styles(context).text.b1))),
        Expanded(child: Container()),
        CustomIconButton(
            icon: Assets.images.icons.plus,
            size: 24,
            iconSize: 18,
            color: styles(context).theme.grey4,
            onPressed: () {}),
      ],
    );
  }
}
