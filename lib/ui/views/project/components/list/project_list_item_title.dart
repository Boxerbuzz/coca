/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../../coca.dart';

class ProjectListItemTitle extends BaseStatelessWidget {
  final ProjectModel data;

  const ProjectListItemTitle(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    double size = 12;
    return Row(
      children: <Widget>[
        Container(
                width: size,
                height: size,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: styles(context).theme.silver, borderRadius: BorderRadius.circular(2)))
            .gestures(onTapUp: (d) => {}, behavior: HitTestBehavior.opaque),
        Gap(styles(context).insets.xs),
        Text(data.name,
                style: styles(context).text.b1.textColor(styles(context).theme.grey7),
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.ellipsis)
            .expanded(),
      ],
    );
  }
}
