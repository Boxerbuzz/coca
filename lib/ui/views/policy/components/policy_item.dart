/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class PolicyItem extends StatelessWidget {
  const PolicyItem({required this.data, super.key});
  final PolicyModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          data.type == PolicyTextEnum.header
              ? Text(data.text, style: styles.text.h3.textColor(styles.theme.grey7))
              : CustomRichTextRender(data.text, style: styles.text.p.textColor(styles.theme.grey4).textHeight(2)),
          ...(data.subs ?? []).map<Widget>((e) => buildSubText(e, context)),
        ],
      ),
    );
  }

  Widget buildSubText(PolicyModel data, BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20).add(const EdgeInsets.symmetric(vertical: 8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.numbering!, style: styles.text.t2),
          const SizedBox(width: 10),
          Expanded(child: Text(data.text, style: styles.text.t2.textColor(styles.theme.grey4).regular)),
        ],
      ),
    );
  }
}
