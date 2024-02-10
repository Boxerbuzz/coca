/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class HelpMoreQuestion extends BaseStatelessWidget {
  const HelpMoreQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(color: styles(context).theme.grey3))),
      margin: EdgeInsets.all(styles(context).insets.md),
      padding: EdgeInsets.symmetric(vertical: styles(context).insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Got more questions?', style: styles(context).text.t1),
          Gap(styles(context).insets.sm),
          Text(
            'You may also send a message to our customer\n support for further questions, enquiry & information.',
            style: styles(context).text.p.textColor(styles(context).theme.grey4),
          ),
          Gap(styles(context).insets.sm),
          CustomOutlineButton(
              text: 'Get in touch with us',
              onPressed: () {},
              textColor: styles(context).theme.blue,
              borderColor: styles(context).theme.blue),
        ],
      ),
    );
  }
}
