/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/buttons/custom_button_with_icon.dart';

class CreateProjectLayoutSelector extends StatelessWidget {
  const CreateProjectLayoutSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Layout', style: styles.text.t1),
        const Gap(12),
        Row(
          children: [
            Expanded(
              child: CustomButtonWithIcon(
                text: 'List',
                icon: Assets.images.icons.list.path,
                btnColor: styles.theme.white,
                border: BorderSide(color: styles.theme.blue),
                txtColor: styles.theme.blue,
                iconColor: styles.theme.blue,
              ),
            ),
            const Gap(12),
            Expanded(
              child: CustomButtonWithIcon(
                text: 'Board',
                icon: Assets.images.icons.kanban.path,
                btnColor: styles.theme.white,
                border: BorderSide(color: styles.theme.silver),
                txtColor: styles.theme.grey4,
                iconColor: styles.theme.grey4,
              ),
            ),
          ],
        )
      ],
    );
  }
}
