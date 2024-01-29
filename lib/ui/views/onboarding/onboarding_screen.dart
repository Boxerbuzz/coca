/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'components/onboarding_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static String route = '/';

  @override
  Widget build(BuildContext context) {
    return const OnboardingBody();
  }
}
