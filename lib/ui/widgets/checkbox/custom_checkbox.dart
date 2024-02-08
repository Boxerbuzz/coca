/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomCheckbox extends BaseStatelessWidget {
  final bool value;
  final double size;
  final void Function(bool)? onChanged;
  final String? label;

  final Color? color;

  const CustomCheckbox({super.key, this.value = false, this.size = 22, this.onChanged, this.label, this.color});

  void _handleTapUp(TapUpDetails details) {
    AppHaptics.buttonPress();
    switch (value) {
      case false:
        onChanged?.call(true);
        break;
      case true:
        onChanged?.call(false);
        break;
    }
  }

  Widget _icon() {
    switch (value) {
      case true:
        return CustomSvg(Assets.images.icons.check).svg(color: Colors.white);
      case false:
        return Container();
    }
  }

  Widget _wrapGestures(Widget child) {
    if (onChanged == null) return child;
    return GestureDetector(onTapUp: _handleTapUp, behavior: HitTestBehavior.opaque, child: child);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: !value ? Colors.transparent : color ?? styles.theme.blue,
            borderRadius: BorderRadius.circular(styles.corners.check),
            border: Border.all(color: !value ? styles.theme.grey4 : color ?? styles.theme.blue, width: 1.5),
          ),
          child: _wrapGestures(_icon()),
        ),
        if (label != null) ...[
          Gap(styles.insets.sm),
          Text(label!, style: styles.text.p),
        ],
      ],
    );
  }
}
