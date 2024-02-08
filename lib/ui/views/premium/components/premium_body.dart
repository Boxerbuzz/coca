/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/cupertino.dart';

import '../../../../coca.dart';
import 'premium_carousel.dart';

class PremiumBody extends StatelessWidget {
  const PremiumBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(styles.insets.md),
          child: Column(
            children: [
              CustomSvg(Assets.images.icons.coca).svg(height: 60, width: 60),
              Gap(styles.insets.sm),
              Text('Upgrade to Premium', style: styles.text.h3.xBold),
              Gap(styles.insets.xs),
              Text(
                'Get the premium feature and get the\n unlimited access to the app',
                style: styles.text.caption.textColor(styles.theme.grey4).regular,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        PremiumCarousel(items: premium, onChange: (value) {}),
        const Gap(25),
      ],
    );
  }
}
