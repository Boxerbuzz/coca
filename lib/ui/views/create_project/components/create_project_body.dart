/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'create_project_access_selector.dart';
import 'create_project_layout_selector.dart';

class CreateProjectBody extends BaseStatelessWidget {
  const CreateProjectBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(styles(context).insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Create Project', style: styles(context).text.t1),
          Gap(styles(context).insets.md),
          CustomTextFieldWithIcon(
            labelText: 'Project Name',
            hintText: 'Enter project name',
            prefixIcon: CustomSvg(Assets.images.icons.agenda).svg(),
          ),
          Gap(styles(context).insets.md),
          CreateProjectLayoutSelector(onChanged: (v) {}),
          Gap(styles(context).insets.md),
          const CreateProjectAccessSelector(),
          Gap(styles(context).insets.md),
          CustomPrimaryButton(label: 'Create', onTap: () {}),
        ],
      ),
    );
  }
}
