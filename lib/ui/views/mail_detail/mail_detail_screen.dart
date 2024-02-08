/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import '../project_detail/components/project_detail_attachment.dart';
import 'components/mail_detail_header.dart';
import 'components/mail_detail_message_render.dart';
import 'components/mail_detail_reply_section.dart';
import 'components/mail_detail_sender_section.dart';

class MailDetailScreen extends StatefulWidget {
  const MailDetailScreen({super.key});

  static String route = '/mail_detail';

  @override
  State<MailDetailScreen> createState() => _MailDetailScreenState();
}

class _MailDetailScreenState extends State<MailDetailScreen> {
  late final MailModel email;

  @override
  void initState() {
    MailProvider store = Provider.of<MailProvider>(context, listen: false);
    email = store.selectedMail!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MailDetailHeader(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MailDetailSenderSection(mail: email),
            MailDetailMessageRender(mail: email),
            const ProjectDetailAttachment(shouldAdd: false),
            const MailDetailReplySection(),
          ],
        ),
      ),
    );
  }
}
