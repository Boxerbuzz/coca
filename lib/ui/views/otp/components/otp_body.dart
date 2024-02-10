/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'otp_input.dart';
import 'otp_resend_code.dart';
import 'otp_success_modal.dart';

class OtpBody extends BaseStatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OtpInput(),
        Gap(styles(context).insets.md),
        const OtpResendCode(),
        Gap(styles(context).insets.xxl),
        CustomPrimaryButton(label: 'Continue', onTap: () => context.go(OtpSuccessModal.route)),
      ],
    );
  }
}
