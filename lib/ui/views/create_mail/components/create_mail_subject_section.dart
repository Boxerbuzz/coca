/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/coca.dart';
import 'package:flutter/material.dart';

class CreateMailSubjectSection extends StatelessWidget {
  const CreateMailSubjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: styles.insets.md, vertical: styles.insets.sm),
      decoration: BoxDecoration(border: Border.symmetric(horizontal: BorderSide(color: styles.theme.silver, width: 1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Subject', style: styles.text.t2),
          Gap(styles.insets.xs),
          Text('Brief Website Redesign', style: styles.text.b1.regular),
        ],
      ),
    );
  }
}
