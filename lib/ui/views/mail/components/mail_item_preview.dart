/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'mail_item_mini_gallery.dart';

class MailItemPreview extends StatelessWidget {
  const MailItemPreview({super.key, required this.email});
  final MailModel email;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            if (email.hasAttachment)
              Padding(
                padding: EdgeInsets.only(right: styles.insets.xxs),
                child: CustomSvg(Assets.images.icons.attachment).svg(color: styles.theme.grey4, size: 17),
              ),
            Flexible(
              child: Text(
                email.message,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: styles.text.p.textColor(styles.theme.grey6),
              ),
            ),
          ],
        ),
        if (email.containsPictures) ...[
          Gap(styles.insets.sm),
          const MailItemMiniGallery(),
        ],
      ],
    );
  }
}
