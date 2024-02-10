/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProjectDetailTaskSubTask extends StatefulWidget {
  const ProjectDetailTaskSubTask({super.key, this.task = '', required this.onChanged, this.value = false});
  final String task;
  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  State<ProjectDetailTaskSubTask> createState() => _ProjectDetailTaskSubTaskState();
}

class _ProjectDetailTaskSubTaskState extends BaseStatefulWidget<ProjectDetailTaskSubTask> {
  late bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: styles.insets.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCheckbox(
            value: value,
            size: 18,
            onChanged: (value) {
              setState(() {
                this.value = value;
                widget.onChanged(value);
              });
            },
            color: styles.theme.green,
          ),
          const Gap(11),
          Expanded(
            child: Text(
              widget.task,
              style: styles.text.t2.regular.copyWith(decoration: value ? TextDecoration.lineThrough : null),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
