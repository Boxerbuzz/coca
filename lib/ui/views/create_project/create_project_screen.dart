/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'components/create_project_layout_selector.dart';

class CreateProjectScreen extends StatelessWidget {
  const CreateProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetLayout(
      child: Padding(
        padding: EdgeInsets.all(styles.insets.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create Project', style: styles.text.t1),
            Gap(styles.insets.md),
            CustomTextFieldWithIcon(
              labelText: 'Project Name',
              hintText: 'Enter project name',
              prefixIcon: Assets.images.icons.agenda.svg(),
            ),
            Gap(styles.insets.md),
            const CreateProjectLayoutSelector(),
            Gap(styles.insets.md),
            CustomPrimaryButton(label: 'Create', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
