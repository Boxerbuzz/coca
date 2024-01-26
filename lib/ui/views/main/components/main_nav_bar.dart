/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'main_nav_item.dart';

class MainNavBar extends StatelessWidget {
  const MainNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    AppStyle styles = context.styles;
    return Container(
      height: 85,
      decoration: BoxDecoration(color: kWhite, boxShadow: styles.shadows.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...navData.map(
            (e) => MainNavItem(
              index: e.index,
              icon: e.icon,
              isFab: e.index == 2 ? true : false,
              onPressed: e.index == 2
                  ? () {
                      Navigator.pushNamed(context, '/cart');
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
