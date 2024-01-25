/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'otp_input.dart';
import 'resend_code.dart';

class VerifyOtpBody extends StatelessWidget {
  const VerifyOtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OtpInput(),
        Gap(context.styles.insets.md),
        const ResendCode(),
        Gap(context.styles.insets.xxl),
        CustomPrimaryButton(
          label: 'Continue',
          onTap: () => CustomModalDialogRoute.showDialog(
            context: context,
            builder: (_) {
              return const SuccessModal();
            },
          ),
        ),
      ],
    );
  }
}
