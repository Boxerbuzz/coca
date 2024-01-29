/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class NotificationCategoryItem extends StatelessWidget {
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
            height: 32,
            duration: 100.milliseconds,
            decoration: BoxDecoration(
              borderRadius: styles.corners.br24,
              color: store.index == index ? styles.theme.blue : styles.theme.grey0,
            ),
            padding: EdgeInsets.all(styles.insets.xs),
            margin: EdgeInsets.only(right: styles.insets.xs),
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
                        ? styles.text.b1.textColor(styles.theme.white)
                        : styles.text.p.textColor(styles.theme.grey7),
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
