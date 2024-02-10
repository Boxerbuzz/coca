/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/buttons/custom_app_button.dart';

class HelpChat extends BaseStatelessWidget {
  const HelpChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(color: styles(context).theme.grey3))),
      margin: EdgeInsets.symmetric(horizontal: styles(context).insets.md),
      padding: EdgeInsets.symmetric(vertical: styles(context).insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Chat with Us', style: styles(context).text.t1),
          Gap(styles(context).insets.sm),
          Text('We are here to assist you better via online chat.',
              style: styles(context).text.p.textColor(styles(context).theme.grey4)),
          Gap(styles(context).insets.sm),
          SizedBox(
            height: 48,
            child: CustomAppButton(
              onPressed: () {},
              expand: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSvg(Assets.images.icons.messageCircle)
                      .svg(color: styles(context).theme.white, height: 24, width: 24),
                  Gap(styles(context).insets.sm),
                  Text('Chat with our Customer Service', style: styles(context).text.b1)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
