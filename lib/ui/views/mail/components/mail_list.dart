/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'mail_item.dart';

class MailList extends StatelessWidget {
  const MailList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mails.length,
      padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
      itemBuilder: (BuildContext context, int position) {
        return MailItem(
          id: position,
          email: mails[position],
          onDeleted: () => {},
        );
      },
    );
  }
}
