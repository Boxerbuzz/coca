/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class OtpResendCode extends BaseStatelessWidget {
  const OtpResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Resend code in',
          style: styles(context).text.t2.textColor(styles(context).theme.grey4),
        ),
        Text(
          ' 00:30',
          style: styles(context).text.t2.textColor(styles(context).theme.blue),
        )
      ],
    );
  }
}
