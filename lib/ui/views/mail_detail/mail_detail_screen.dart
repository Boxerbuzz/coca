/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/ui/views/mail_detail/components/mail_detail_message_render.dart';
import 'package:coca/ui/views/mail_detail/components/mail_detail_reply_section.dart';
import 'package:coca/ui/views/mail_detail/components/mail_detail_sender_section.dart';
import 'package:flutter/material.dart';

import '../../../coca.dart';
import '../project_detail/components/project_detail_attachment.dart';

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
      appBar: CustomAppBar(
        title: '',
        trailing: Row(
          children: [
            CustomIconButton(icon: Assets.images.editor.redo.path, color: styles.theme.grey6, onPressed: () {}),
            CustomIconButton(icon: Assets.images.icons.trash.path, color: styles.theme.grey6, onPressed: () {}),
            CustomIconButton(icon: Assets.images.icons.dots.path, color: styles.theme.grey6, onPressed: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
