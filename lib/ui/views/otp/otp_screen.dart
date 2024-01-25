/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../coca.dart';
import 'components/verify_otp_body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  static String route = '/verify_otp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: ''),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: context.styles.insets.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthHeader(
              headerText: 'Verify Code',
              subHeaderText: 'Please enter the code we just sent to your mobile number',
            ),
            Gap(context.styles.insets.md),
            const VerifyOtpBody(),
          ],
        ),
      ),
    );
  }
}
