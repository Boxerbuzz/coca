/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'components/project_body.dart';
import 'components/project_header.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProjectHeader(),
      body: ProjectBody(),
    );
  }
}
