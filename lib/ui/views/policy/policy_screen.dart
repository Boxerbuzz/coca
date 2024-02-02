/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/ui/views/policy/components/policy_header.dart';
import 'package:flutter/material.dart';

import 'components/policy_body.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  static const String route = '/policy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PolicyHeader(),
      body: const PolicyBody(),
    );
  }
}
