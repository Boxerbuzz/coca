/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/core/core.dart';
import 'package:flutter/material.dart';

class OtpResendCode extends StatelessWidget {
  const OtpResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Resend code in',
          style: context.styles.text.t2.textColor(kGray04),
        ),
        Text(
          ' 00:30',
          style: context.styles.text.t2.textColor(kBlue),
        )
      ],
    );
  }
}
