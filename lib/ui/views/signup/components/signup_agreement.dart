/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class SignupAgreement extends StatelessWidget {
  const SignupAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, store, child) {
        return Row(
          children: [
            CustomCheckbox(value: store.tcAgreement, onChanged: (value) => store.tcAgreement = value),
            Gap(styles.insets.xxs),
            Expanded(
              child: Wrap(
                children: [
                  Text('I agree to the ', style: styles.text.p.textColor(styles.theme.grey4)),
                  Text('Terms of Service ', style: styles.text.p.bold.textColor(styles.theme.blue)),
                  const Gap(8),
                  Text('and ', style: styles.text.p.textColor(styles.theme.grey4)),
                  Text('Privacy Policy', style: styles.text.p.bold.textColor(styles.theme.blue)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
