/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'components/help_body.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  static String route = '/help';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Help Center',
        trailing: CustomIconButton(
          icon: Assets.images.icons.search,
          color: styles.theme.grey7,
          onPressed: () {},
        ),
      ),
      body: const HelpBody(),
    );
  }
}
