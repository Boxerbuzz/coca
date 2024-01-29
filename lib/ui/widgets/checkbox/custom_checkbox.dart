/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';

class CustomCheckbox extends BaseStatelessWidget {
  final CustomCheckboxEnum value;
  final double size;
  final void Function(CustomCheckboxEnum)? onChanged;
  final String? label;

  const CustomCheckbox(
      {super.key, this.value = CustomCheckboxEnum.unchecked, this.size = 22, this.onChanged, this.label});

  void _handleTapUp(TapUpDetails details) {
    AppHaptics.buttonPress();
    switch (value) {
      case CustomCheckboxEnum.unchecked:
        onChanged?.call(CustomCheckboxEnum.checked);
        break;
      case CustomCheckboxEnum.checked:
        onChanged?.call(CustomCheckboxEnum.unchecked);
        break;
    }
  }

  Widget _getIconForCurrentState() {
    switch (value) {
      case CustomCheckboxEnum.checked:
        return Assets.images.icons.check.svg(color: Colors.white);
      case CustomCheckboxEnum.unchecked:
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
            color: value == CustomCheckboxEnum.unchecked ? Colors.transparent : styles.theme.blue,
            borderRadius: BorderRadius.circular(styles.corners.check),
            border: Border.all(
              color: value == CustomCheckboxEnum.unchecked ? styles.theme.grey4 : styles.theme.blue,
              width: 1.5,
            ),
          ),
          child: _wrapGestures(_getIconForCurrentState()),
        ),
        if (label != null) ...[
          Gap(styles.insets.sm),
          Text(label!, style: styles.text.p),
        ],
      ],
    );
  }
}
