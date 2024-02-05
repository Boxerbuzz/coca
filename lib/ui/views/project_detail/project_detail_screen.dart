/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'components/project_detail_body.dart';
import 'components/project_detail_header.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key});

  static String route = '/project_detail';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProjectDetailHeader(),
      body: SingleChildScrollView(child: ProjectDetailBody()),
    );
  }
}
