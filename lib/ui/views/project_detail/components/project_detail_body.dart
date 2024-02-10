/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/ui/views/project_detail/components/project_detail_comment_block.dart';
import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'project_detail_attachment.dart';
import 'project_detail_comments.dart';
import 'project_detail_description.dart';
import 'project_detail_info.dart';
import 'project_detail_tasks.dart';

class ProjectDetailBody extends BaseStatelessWidget {
  const ProjectDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProjectDetailInfo(),
        Container(height: 12, color: styles(context).theme.grey2),
        const ProjectDetailDescription(),
        Container(height: 12, color: styles(context).theme.grey2),
        const ProjectDetailAttachment(),
        Container(height: 12, color: styles(context).theme.grey2),
        const ProjectDetailTasks(),
        Container(height: 12, color: styles(context).theme.grey2),
        const ProjectDetailComments(),
        const ProjectDetailCommentBlock(),
      ],
    );
  }
}
