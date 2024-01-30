/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'help_chat.dart';
import 'help_item.dart';
import 'help_more_question.dart';

class HelpBody extends StatelessWidget {
  const HelpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HelpItem(title: 'Get started', onPressed: () {}),
          HelpItem(title: 'How to Create Projects', onPressed: () {}),
          HelpItem(title: 'How to Create Tasks & Assign them', onPressed: () {}),
          HelpItem(title: 'Close Account', onPressed: () {}),
          HelpItem(title: 'Adding New Members to your Team', onPressed: () {}),
          const HelpMoreQuestion(),
          const HelpChat(),
        ],
      ),
    );
  }
}
