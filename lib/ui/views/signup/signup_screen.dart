/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../coca.dart';
import 'components/signup_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  static String route = '/registration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: ''),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: context.styles.insets.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthHeader(headerText: 'Sign Up', subHeaderText: 'Create an account to continue'),
            GoogleButton(label: 'Sign Up with Google', onPressed: () {}),
            const SignupBody(),
          ],
        ),
      ),
    );
  }
}
