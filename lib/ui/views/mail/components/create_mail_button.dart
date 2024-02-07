/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import '../../../widgets/buttons/custom_button_with_icon.dart';

class CreateMailButton extends StatelessWidget {
  const CreateMailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: styles.insets.md, vertical: styles.insets.sm),
      child: SizedBox(
        height: 50,
        child: CustomButtonWithIcon(
          onPressed: () => context.push(CreateMailScreen.route),
          btnColor: styles.theme.grey2,
          icon: Assets.images.icons.write.path,
          text: 'Write Message',
          iconColor: styles.theme.grey4,
          txtColor: styles.theme.grey7,
        ),
      ),
    );
  }
}
