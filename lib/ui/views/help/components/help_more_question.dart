/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class HelpMoreQuestion extends StatelessWidget {
  const HelpMoreQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(color: styles.theme.grey3))),
      margin: EdgeInsets.all(styles.insets.md),
      padding: EdgeInsets.symmetric(vertical: styles.insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Got more questions?', style: styles.text.t1),
          Gap(styles.insets.sm),
          Text(
            'You may also send a message to our customer\n support for further questions, enquiry & information.',
            style: styles.text.p.textColor(styles.theme.grey4),
          ),
          Gap(styles.insets.sm),
          CustomOutlineButton(
              text: 'Get in touch with us',
              onPressed: () {},
              textColor: styles.theme.blue,
              borderColor: styles.theme.blue),
        ],
      ),
    );
  }
}
