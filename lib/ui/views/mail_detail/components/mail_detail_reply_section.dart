/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/coca.dart';
import 'package:flutter/material.dart';

class MailDetailReplySection extends StatelessWidget {
  const MailDetailReplySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.symmetric(horizontal: BorderSide(color: styles.theme.silver, width: 1)),
          ),
          padding: EdgeInsets.all(styles.insets.sm),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CustomIconButton(icon: Assets.images.editor.undo, onPressed: () {}),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Azalea Nirmala', style: styles.text.t2),
                  Text('aza@gmail.com', style: styles.text.t3.textColor(styles.theme.grey4)),
                ],
              ),
              const Spacer(),
              CustomIconButton(icon: Assets.images.icons.edit, onPressed: () {}),
              CustomIconButton(icon: Assets.images.icons.trash, onPressed: () {}),
              CustomIconButton(icon: Assets.images.icons.dots, onPressed: () {})
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: styles.insets.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi sis,', style: styles.text.caption.textColor(styles.theme.grey7)),
              Gap(styles.insets.md),
              Text(
                "Thanks for your quick response. Keep up the great work. 👍",
                style: styles.text.caption.textColor(styles.theme.grey7),
              ),
              Gap(styles.insets.sm),
              Text("Regards", style: styles.text.caption.textColor(styles.theme.grey7)),
            ],
          ),
        ),
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
                child: CustomPrimaryButton(label: 'Reply Message', onTap: () {}),
              ),
              const Spacer(),
              CustomIconButton(icon: Assets.images.editor.titleCase, onPressed: () {}),
              CustomIconButton(icon: Assets.images.icons.attachment, onPressed: () {})
            ],
          ),
        ),
      ],
    );
  }
}
