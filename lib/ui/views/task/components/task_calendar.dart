/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/coca.dart';
import 'package:flutter/material.dart';

import 'task_calendar_header.dart';

class TaskCalendar extends BaseStatelessWidget {
  const TaskCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TaskCalendarHeader(),
        Expanded(
          child: Center(child: Text('Coming soon....', style: styles(context).text.caption)),
        ),
      ],
    );
  }
}
