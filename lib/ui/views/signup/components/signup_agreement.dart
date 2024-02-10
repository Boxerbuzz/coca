/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class SignupAgreement extends BaseStatelessWidget {
  const SignupAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, store, child) {
        return Row(
          children: [
            CustomCheckbox(value: store.tcAgreement, onChanged: (value) => store.tcAgreement = value),
            Gap(styles(context).insets.xxs),
            Expanded(
              child: Wrap(
                children: [
                  Text('I agree to the ', style: styles(context).text.p.textColor(styles(context).theme.grey4)),
                  Text('Terms of Service ', style: styles(context).text.p.bold.textColor(styles(context).theme.blue)),
                  const Gap(8),
                  Text('and ', style: styles(context).text.p.textColor(styles(context).theme.grey4)),
                  Text('Privacy Policy', style: styles(context).text.p.bold.textColor(styles(context).theme.blue)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
