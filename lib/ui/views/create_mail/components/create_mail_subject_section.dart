/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/coca.dart';
import 'package:flutter/material.dart';

class CreateMailSubjectSection extends BaseStatelessWidget {
  const CreateMailSubjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md, vertical: styles(context).insets.sm),
      decoration: BoxDecoration(
          border: Border.symmetric(horizontal: BorderSide(color: styles(context).theme.silver, width: 1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Subject', style: styles(context).text.t2),
          Gap(styles(context).insets.xs),
          Text('Brief Website Redesign', style: styles(context).text.b1.regular),
        ],
      ),
    );
  }
}
