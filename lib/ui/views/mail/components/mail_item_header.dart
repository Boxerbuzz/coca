/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class MailItemHeader extends StatelessWidget {
  const MailItemHeader({super.key, required this.email});
  final MailModel email;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${email.sender} — ${email.time}',
                style: styles.text.caption.textColor(styles.theme.grey4),
              ),
              const Gap(2),
              Text(
                email.subject,
                style: email.containsPictures ? styles.text.t2 : styles.text.t2.textColor(styles.theme.grey7),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Hero(tag: email.subject, child: CustomAvatar(user: participants()[0], size: 30)),
      ],
    );
  }
}
