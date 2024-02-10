/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import "../../../../coca.dart";

class ProjectDetailAttachmentGallery extends BaseStatelessWidget {
  const ProjectDetailAttachmentGallery({super.key, this.attachments = const [], this.isHorizontal = false});
  final List<AssetModel> attachments;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return isHorizontal ? _horizontal() : _vertical(context);
  }

  Widget _vertical(BuildContext context) {
    return Column(
      children: attachments.map((e) {
        bool isImage = e.ext == FileExtensionEnum.png;

        Color color = isImage ? styles(context).theme.hGreen : styles(context).theme.hBlue;

        return Container(
          decoration: BoxDecoration(borderRadius: styles(context).corners.br16, color: color.withOpacity(.3)),
          padding: EdgeInsets.all(styles(context).insets.sm),
          margin: EdgeInsets.only(bottom: styles(context).insets.sm),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(color: color.withOpacity(.4), borderRadius: styles(context).corners.br12),
                  child: CustomSvg(isImage ? Assets.images.icons.image : Assets.images.icons.file).svg()),
              Gap(styles(context).insets.sm),
              Expanded(child: _buildLabel(e, context)),
              CustomSvg(Assets.images.icons.dots).svg(width: 24, height: 24, color: styles(context).theme.grey4)
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _horizontal() {
    return SizedBox(
      height: 100,
      child: CustomHorizontalScroll(
        child: Row(
          children: [
            ...attachments.map((e) => Container()),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(AssetModel model, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(model.path, style: styles(context).text.t2.textColor(styles(context).theme.grey6)),
        const Gap(4),
        Text(model.size, style: styles(context).text.p.textColor(styles(context).theme.grey4)),
      ],
    );
  }
}
