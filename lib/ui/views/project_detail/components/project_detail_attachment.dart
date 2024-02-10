/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'project_detail_attachment_gallery.dart';

class ProjectDetailAttachment extends BaseStatelessWidget {
  const ProjectDetailAttachment({super.key, this.shouldAdd = true});
  final bool? shouldAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomSvg(Assets.images.icons.attachment).svg(color: styles(context).theme.grey7),
            Gap(styles(context).insets.sm),
            Text('Attachments', style: styles(context).text.t1),
            Expanded(child: Container()),
            shouldAdd == true
                ? CustomIconButton(icon: Assets.images.icons.plus, onPressed: () {}, color: styles(context).theme.grey7)
                : const SizedBox.shrink(),
          ],
        ).padding(all: styles(context).insets.md, bottom: styles(context).insets.xxs),
        Gap(styles(context).insets.sm),
        ProjectDetailAttachmentGallery(attachments: attachments).padding(horizontal: styles(context).insets.md),
      ],
    );
  }
}
