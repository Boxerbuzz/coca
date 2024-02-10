/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/coca.dart';
import 'package:flutter/material.dart';

class MailDetailReplySection extends BaseStatelessWidget {
  const MailDetailReplySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.symmetric(horizontal: BorderSide(color: styles(context).theme.silver, width: 1)),
          ),
          padding: EdgeInsets.all(styles(context).insets.sm),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CustomIconButton(icon: Assets.images.editor.undo, color: styles(context).theme.grey7, onPressed: () {}),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Azalea Nirmala', style: styles(context).text.t2),
                  Text('aza@gmail.com', style: styles(context).text.t3.textColor(styles(context).theme.grey4)),
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
          padding: EdgeInsets.symmetric(vertical: styles(context).insets.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi sis,', style: styles(context).text.caption.textColor(styles(context).theme.grey7)),
              Gap(styles(context).insets.md),
              Text(
                "Thanks for your quick response. Keep up the great work. 👍",
                style: styles(context).text.caption.textColor(styles(context).theme.grey7),
              ),
              Gap(styles(context).insets.sm),
              Text("Regards", style: styles(context).text.caption.textColor(styles(context).theme.grey7)),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.symmetric(horizontal: BorderSide(color: styles(context).theme.silver, width: 1)),
          ),
          padding: EdgeInsets.all(styles(context).insets.md),
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
