/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import "../../../../coca.dart";

class ProjectDetailAttachmentGallery extends StatelessWidget {
  const ProjectDetailAttachmentGallery({super.key, this.attachments = const [], this.isHorizontal = false});
  final List<AssetModel> attachments;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return isHorizontal ? _horizontal() : _vertical();
  }

  Widget _vertical() {
    return Column(
      children: attachments.map((e) {
        bool isImage = e.ext == FileExtensionEnum.png;

        Color color = isImage ? styles.theme.hGreen : styles.theme.hBlue;

        return Container(
          height: 80,
          decoration: BoxDecoration(borderRadius: styles.corners.br16, color: color.withOpacity(.3)),
          padding: EdgeInsets.all(styles.insets.sm),
          margin: EdgeInsets.only(bottom: styles.insets.sm),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(color: color.withOpacity(.4), borderRadius: styles.corners.br12),
                  child: CustomSvg(isImage ? Assets.images.icons.image : Assets.images.icons.file).svg()),
              Gap(styles.insets.sm),
              Expanded(child: _buildLabel(e)),
              CustomSvg(Assets.images.icons.dots).svg(width: 24, height: 24, color: styles.theme.grey4)
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

  Widget _buildLabel(AssetModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(model.path, style: styles.text.t2.textColor(styles.theme.grey6)),
        const Gap(4),
        Text(model.size, style: styles.text.p.textColor(styles.theme.grey4)),
      ],
    );
  }
}
