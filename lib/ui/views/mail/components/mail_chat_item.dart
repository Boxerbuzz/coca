/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class MailChatItem extends BaseStatelessWidget {
  const MailChatItem(this.user, {super.key, this.trailing});
  final UserModel user;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Stack(
            children: [
              CustomAvatar(user: user, size: 30),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: styles(context).theme.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: styles(context).theme.white, width: 2),
                ),
              )
            ],
          ),
          const Gap(10),
          Text(
            '${user.firstName} ${user.lastName}',
            style: styles(context).text.p.textColor(styles(context).theme.grey6),
          ),
          const Spacer(),
          trailing ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
