/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

class CreateProjectAccessSelector extends StatefulWidget {
  const CreateProjectAccessSelector({super.key});

  @override
  State<CreateProjectAccessSelector> createState() => _CreateProjectAccessSelectorState();
}

class _CreateProjectAccessSelectorState extends State<CreateProjectAccessSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Category', style: styles.text.t1),
        const Gap(12),
        Container(
          height: 48,
          decoration: BoxDecoration(borderRadius: styles.corners.br8, border: Border.all(color: styles.theme.silver)),
          padding: EdgeInsets.symmetric(horizontal: styles.insets.btn),
          child: Row(
            children: [
              Assets.images.icons.users.svg(height: 24, width: 24),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text('Public', style: styles.text.b1),
                ),
              ),
              Assets.images.icons.arrowDown.svg(height: 24, width: 24, color: styles.theme.grey6),
            ],
          ),
        ),
      ],
    );
  }
}
