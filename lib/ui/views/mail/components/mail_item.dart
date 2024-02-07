/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'mail_item_header.dart';
import 'mail_item_preview.dart';

class MailItem extends StatelessWidget {
  const MailItem({super.key, required this.id, required this.email, this.onDeleted});

  final int id;
  final MailModel email;
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(email),
      dismissThresholds: const {
        DismissDirection.startToEnd: 1,
        DismissDirection.endToStart: 0.4,
      },
      onDismissed: (DismissDirection direction) {
        switch (direction) {
          case DismissDirection.endToStart:
            onDeleted!();
            break;
          case DismissDirection.startToEnd:
            // TODO: Handle this case.
            break;
          default:
          // Do not do anything
        }
      },
      background: Container(
        decoration: BoxDecoration(color: styles.theme.amber),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomSvg(Assets.images.icons.star.path).svg(color: styles.theme.grey7),
      ),
      secondaryBackground: Container(
        decoration: BoxDecoration(color: styles.theme.grey7),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomSvg(Assets.images.icons.trash.path).svg(color: styles.theme.silver),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: styles.theme.silver, width: 1)),
          color: styles.theme.white,
        ),
        child: Consumer<MailProvider>(builder: (BuildContext context, MailProvider store, Widget? child) {
          return InkWell(
            onTap: () {
              store.selectedMail = email;
              context.push(MailDetailScreen.route);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: styles.insets.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MailItemHeader(email: email),
                  if (!email.isRead) const SizedBox(height: 14),
                  if (!email.isRead) MailItemPreview(email: email),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
