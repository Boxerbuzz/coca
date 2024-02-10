/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/buttons/custom_button_with_icon.dart';

class CreateMailButton extends BaseStatelessWidget {
  const CreateMailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: styles(context).insets.md, vertical: styles(context).insets.sm),
      child: SizedBox(
        height: 50,
        child: CustomButtonWithIcon(
          onPressed: () => context.push(CreateMailScreen.route),
          btnColor: styles(context).theme.grey2,
          icon: Assets.images.icons.write,
          text: 'Write Message',
          iconColor: styles(context).theme.grey7,
          txtColor: styles(context).theme.grey7,
        ),
      ),
    );
  }
}
