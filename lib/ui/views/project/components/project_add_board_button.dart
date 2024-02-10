/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/buttons/custom_button_with_icon.dart';

class ProjectAddBoardButton extends BaseStatelessWidget {
  const ProjectAddBoardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButtonWithIcon(
      icon: Assets.images.icons.plus,
      text: 'Add',
      onPressed: () {},
      border: BorderSide(color: styles(context).theme.silver),
      shrinkWrap: true,
      btnColor: Colors.white,
      iconColor: styles(context).theme.grey7,
      txtColor: styles(context).theme.grey7,
    );
  }
}
