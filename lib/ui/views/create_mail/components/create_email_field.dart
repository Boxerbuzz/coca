/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class CreateMailInputField extends BaseStatelessWidget {
  const CreateMailInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(styles(context).insets.md),
      decoration: BoxDecoration(color: styles(context).theme.grey2),
    );
  }
}
