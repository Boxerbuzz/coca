/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../coca.dart';

class MailDetailSenderSection extends StatelessWidget {
  const MailDetailSenderSection({super.key, required this.mail});
  final MailModel mail;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: styles.theme.silver, width: 1))),
      padding: EdgeInsets.all(styles.insets.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CustomAvatar(user: participants()[0], size: 48),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('John Doe', style: styles.text.t2),
              Text('aza@gmail.com', style: styles.text.t3.textColor(styles.theme.grey4)),
            ],
          ),
          const Spacer(),
          Text("Today, ${DateFormat('h:mm a').format(DateTime.now())}",
              style: styles.text.t3.textColor(styles.theme.grey4)),
          CustomIconButton(icon: Assets.images.icons.star, onPressed: () {}, color: styles.theme.grey4),
        ],
      ),
    );
  }
}
