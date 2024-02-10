/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class MailDrawerSection extends StatefulWidget {
  const MailDrawerSection({super.key, required this.title, this.children = const [], this.isExpanded = false});
  final String title;
  final List<Widget> children;
  final bool isExpanded;

  @override
  State<MailDrawerSection> createState() => _MailDrawerSectionState();
}

class _MailDrawerSectionState extends BaseStatefulWidget<MailDrawerSection> {
  bool _isExpanded = false;

  @override
  void initState() {
    _isExpanded = widget.isExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 32,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: styles.insets.xxs),
            child: Row(
              children: [
                const Gap(12),
                Text(widget.title, style: styles.text.b2.textColor(styles.theme.grey4)),
                const Spacer(),
                RotatedBox(
                  quarterTurns: _isExpanded ? 2 : 3,
                  child: CustomIconButton(
                      onPressed: () => setState(() => _isExpanded = !_isExpanded),
                      icon: Assets.images.icons.arrowDown,
                      size: 16,
                      iconSize: 20,
                      color: styles.theme.grey4),
                ),
              ],
            ),
          ),
        ).clickable(() => setState(() => _isExpanded = !_isExpanded)),
        AnimatedCrossFade(
          crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
          firstChild: const SizedBox.shrink(),
          secondChild: Padding(
            padding: EdgeInsets.symmetric(vertical: styles.insets.sm, horizontal: styles.insets.xxs),
            child: Column(
              children: [
                ...widget.children.map((e) => e),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
