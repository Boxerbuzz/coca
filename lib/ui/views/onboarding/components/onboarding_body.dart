/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class OnboardingBody extends BaseStatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(right: 0, left: 0, top: context.heightPct(.1), child: Assets.images.mock.image()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: context.width,
            height: context.heightPct(.35),
            decoration: BoxDecoration(boxShadow: styles(context).shadows.sm, color: styles(context).theme.white),
            padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Plan Your Task Easily and Task Your Plan Instantly', style: styles(context).text.h1),
                Gap(styles(context).insets.md),
                CustomPrimaryButton(label: 'Get Started', onTap: () => context.go(LoginScreen.route)),
                Gap(styles(context).insets.md),
                OneLineClickableText(actionText: 'Login', mainText: 'Have an account?', onTap: () {}),
                const Gap(56),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
