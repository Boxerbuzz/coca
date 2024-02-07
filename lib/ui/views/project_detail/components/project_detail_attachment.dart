/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'project_detail_attachment_gallery.dart';

class ProjectDetailAttachment extends StatelessWidget {
  const ProjectDetailAttachment({super.key, this.shouldAdd = true});
  final bool? shouldAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Assets.images.icons.attachment.svg(width: 24, height: 24),
            Gap(styles.insets.sm),
            Text('Attachments', style: styles.text.t1),
            Expanded(child: Container()),
            shouldAdd == true
                ? CustomIconButton(icon: Assets.images.icons.plus.path, onPressed: () {}, color: styles.theme.grey4)
                : const SizedBox.shrink(),
          ],
        ).padding(all: styles.insets.md, bottom: styles.insets.xxs),
        Gap(styles.insets.sm),
        ProjectDetailAttachmentGallery(attachments: attachments).padding(horizontal: styles.insets.md),
      ],
    );
  }
}
