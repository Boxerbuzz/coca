/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class ChatList extends BaseStatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...participants().map(
            (e) => Container(
              padding: EdgeInsets.symmetric(
                horizontal: styles(context).insets.xxs,
                vertical: styles(context).insets.xxs,
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: styles(context).theme.silver)),
              ),
              child: Row(
                children: [
                  CustomAvatar(user: e, size: 50).padding(all: 10),
                  Gap(styles(context).insets.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${e.firstName} ${e.lastName}', style: styles(context).text.t2),
                        Text(e.email, style: styles(context).text.p.textColor(styles(context).theme.grey4)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
