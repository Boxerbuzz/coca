/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class CreateMailMessageBody extends StatelessWidget {
  const CreateMailMessageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.symmetric(horizontal: BorderSide(color: styles.theme.silver, width: 1)),
          ),
          padding: EdgeInsets.all(styles.insets.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
                width: 132,
                child: CustomPrimaryButton(label: 'Send Message', onTap: () {}),
              ),
              const Spacer(),
              CustomIconButton(icon: Assets.images.editor.titleCase, onPressed: () {}),
              CustomIconButton(icon: Assets.images.icons.attachment, onPressed: () {}),
              CustomIconButton(icon: Assets.images.icons.trash, onPressed: () {}),
              CustomIconButton(icon: Assets.images.icons.dots, onPressed: () {})
            ],
          ),
        ),
      ],
    );
  }
}
