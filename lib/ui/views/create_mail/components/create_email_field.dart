/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class CreateMailInputField extends StatelessWidget {
  const CreateMailInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(styles.insets.md),
      decoration: BoxDecoration(color: styles.theme.grey2),
    );
  }
}
