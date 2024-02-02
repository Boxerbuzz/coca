/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ProjectEmptyPlaceholder extends StatelessWidget {
  const ProjectEmptyPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEmptyPlaceHolder(
        title: "Plan your project & Create Task",
        subtitle: "Create task to manage and tracking your project easily instantly incredibly",
        assets: Assets.images.icons.emptyProjects.path,
        size: const Size(178, 195));
  }
}
