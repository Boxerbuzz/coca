/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'otp_input.dart';
import 'otp_resend_code.dart';
import 'otp_success_modal.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OtpInput(),
        Gap(context.styles.insets.md),
        const OtpResendCode(),
        Gap(context.styles.insets.xxl),
        CustomPrimaryButton(
          label: 'Continue',
          onTap: () => CustomModalDialogRoute.showDialog(
            context: context,
            builder: (_) {
              return const OtpSuccessModal();
            },
          ),
        ),
      ],
    );
  }
}
