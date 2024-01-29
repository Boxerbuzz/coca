/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'components/otp_body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  static String route = '/otp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: ''),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAuthHeader(
              headerText: 'Verify Code',
              subHeaderText: 'Please enter the code we just sent to your mobile number',
            ),
            Gap(styles.insets.md),
            const OtpBody(),
          ],
        ),
      ),
    );
  }
}
