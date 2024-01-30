/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'components/premium_body.dart';
import 'components/premium_header.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  static String route = '/premium';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PremiumHeader(),
            Expanded(child: PremiumBody()),
          ],
        ),
      ),
    );
  }
}
