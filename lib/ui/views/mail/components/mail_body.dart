/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'create_mail_button.dart';
import 'mail_list.dart';

class MailBody extends StatelessWidget {
  const MailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CreateMailButton(),
        Expanded(
          child: MailList(),
        ),
      ],
    );
  }
}

// CustomEmptyPlaceHolder(
// title: 'You haven’t any message',
// subtitle: 'Let us notify you and show the messages\n here for better communication.',
// assets: Assets.images.icons.emptyInbox.path,
// size: const Size(120, 118))
