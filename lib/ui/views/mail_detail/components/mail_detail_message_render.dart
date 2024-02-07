/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../mail/components/mail_item_mini_gallery.dart';

class MailDetailMessageRender extends StatelessWidget {
  const MailDetailMessageRender({super.key, required this.mail});
  final MailModel mail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(styles.insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Brief Website Redesign', style: styles.text.t1),
          const Gap(12),
          Column(
            children: [
              Text(
                'Hi sis,\n \nI hope you are doing well. I am writing to inform you that we are in the process of '
                'redesigning our website. We are looking for a new design that is more modern and user-friendly. '
                'We would like to get your input on this. Please let me know if you have any ideas or suggestions'
                '. \nThank you!',
                style: styles.text.caption.textColor(styles.theme.grey7),
              ),
              Gap(styles.insets.md),
              const MailItemMiniGallery(),
            ],
          ),
        ],
      ),
    );
  }
}
