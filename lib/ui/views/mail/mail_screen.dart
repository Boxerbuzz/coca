/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'components/mail_body.dart';
import 'components/mail_drawer.dart';
import 'components/mail_header.dart';

class MailScreen extends StatelessWidget {
  const MailScreen({super.key});

  static String route = '/mail';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MailHeader(),
      body: MailBody(),
      endDrawer: MailDrawer(),
    );
  }
}
