/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class OtpSuccessModal extends BaseStatelessWidget {
  const OtpSuccessModal({super.key});

  static String route = '/otp_success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles(context).theme.blue,
      body: Padding(
        padding: EdgeInsets.all(styles(context).insets.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(140),
            Container(
              height: 124,
              width: 124,
              decoration: BoxDecoration(color: primary.shade700, borderRadius: BorderRadius.circular(62)),
              child: CustomSvg(Assets.images.icons.check).svg(),
            ),
            const Gap(40),
            Text('Account Verified', style: styles(context).text.h3.textColor(styles(context).theme.white)),
            Gap(styles(context).insets.xs),
            Text(
              'Your account has been successfully verified and all features are at your disposal',
              style: styles(context).text.caption.textColor(styles(context).theme.grey2),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(styles(context).insets.md),
        child: CustomSecondaryButton(label: 'Get Started', onTap: () => context.go(MainScreen.route)),
      ),
    );
  }
}
