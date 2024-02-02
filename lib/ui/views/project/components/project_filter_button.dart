/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/buttons/custom_button_with_icon.dart';

class ProjectFilterButton extends StatelessWidget {
  const ProjectFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButtonWithIcon(
      icon: Assets.images.icons.alignCenter.path,
      text: 'Filter',
      onPressed: () {},
      border: BorderSide(color: styles.theme.silver),
      shrinkWrap: true,
      btnColor: Colors.white,
      iconColor: styles.theme.grey4,
      txtColor: styles.theme.grey7,
    );
  }
}
