/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class MainNavItem extends StatelessWidget {
  final int index;
  final String icon;
  final bool isFab;
  final VoidCallback? onPressed;

  const MainNavItem({required this.index, required this.icon, super.key, this.isFab = false, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, store, child) {
        return isFab
            ? FloatingActionButton(
                onPressed: onPressed,
                backgroundColor: kBlack,
                shape: const CircleBorder(),
                heroTag: AppConstants.createProjectFabHeroTag,
                child: SvgPicture.asset(icon))
            : IconButton(
                highlightColor: Colors.transparent,
                onPressed: () {
                  if (store.pageIndex == index) return;
                  AppHaptics.selectionClick();
                  store.pageIndex = index;
                },
                icon: Stack(
                  children: [
                    SvgPicture.asset(
                      icon,
                      colorFilter: ColorFilter.mode(
                        store.pageIndex == index ? kBlue : kGray07,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
