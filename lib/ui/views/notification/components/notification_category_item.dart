/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class NotificationCategoryItem extends BaseStatelessWidget {
  const NotificationCategoryItem({super.key, required this.index, required this.title, this.icon});
  final int index;
  final String? icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
      builder: (context, store, child) {
        return GestureDetector(
          onTap: () => store.index = index,
          child: AnimatedContainer(
            duration: 100.milliseconds,
            decoration: BoxDecoration(
              borderRadius: styles(context).corners.br24,
              color: store.index == index ? styles(context).theme.blue : styles(context).theme.grey0,
            ),
            padding: EdgeInsets.all(styles(context).insets.xs),
            margin: EdgeInsets.only(right: styles(context).insets.xs),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    title,
                    style: store.index == index
                        ? styles(context).text.b1.textColor(styles(context).theme.white)
                        : styles(context).text.p.textColor(styles(context).theme.grey7),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
