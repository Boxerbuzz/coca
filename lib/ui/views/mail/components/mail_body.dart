/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/coca.dart';
import 'package:flutter/material.dart';

import 'create_mail_button.dart';
import 'mail_item.dart';

class MailBody extends StatefulWidget {
  const MailBody({super.key});

  @override
  State<MailBody> createState() => _MailBodyState();
}

class _MailBodyState extends State<MailBody> {
  final ScrollController _controller = ScrollController();

  bool isEmptyList = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: CustomSliverAppBarDelegate(
              minHeight: 90.0,
              maxHeight: 90.0,
              child: Container(color: styles.theme.grey3, child: const CreateMailButton())),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (_, int index) {
              return isEmptyList
                  ? CustomEmptyPlaceHolder(
                      title: 'You haven’t any message',
                      subtitle: 'Let us notify you and show the messages\n here for better communication.',
                      assets: Assets.images.icons.emptyInbox,
                      size: const Size(120, 118),
                      height: context.heightPct(.7),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: styles.insets.md),
                      child: Column(
                        children: [
                          ...mails.map((e) => MailItem(id: index, email: e, onDeleted: () => {})),
                        ],
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
