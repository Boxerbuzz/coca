/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'project_filter_button.dart';
import 'project_view_switcher.dart';

class ProjectBody extends StatefulWidget {
  const ProjectBody({super.key});

  @override
  State<ProjectBody> createState() => _ProjectBodyState();
}

class _ProjectBodyState extends State<ProjectBody> {
  final GlobalKey dropdownKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(styles.insets.md),
          child: Row(
            children: [
              ProjectViewSwitcher(key: dropdownKey),
              Expanded(child: Container()),
              const ProjectFilterButton(),
            ],
          ),
        ),
      ],
    );
  }
}
