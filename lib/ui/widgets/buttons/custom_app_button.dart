/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../coca.dart';
import 'custom_button_effect.dart';
import 'custom_button_focus_builder.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    super.key,
    required this.onPressed,
    this.semanticLabel = '',
    this.enableFeedback = true,
    this.pressEffect = true,
    this.child,
    this.padding,
    this.expand = false,
    this.isSecondary = false,
    this.circular = false,
    this.minimumSize,
    this.bgColor,
    this.border,
  }) : _builder = null;

  // interaction:
  final VoidCallback? onPressed;
  final String? semanticLabel;
  final bool enableFeedback;

  // content:
  final Widget? child;
  final WidgetBuilder? _builder;

  // layout:
  final EdgeInsets? padding;
  final bool expand;
  final bool circular;
  final Size? minimumSize;

  // style:
  final bool isSecondary;
  final BorderSide? border;
  final Color? bgColor;
  final bool pressEffect;

  @override
  Widget build(BuildContext context) {
    Color defaultColor = isSecondary ? styles.theme.white : styles.theme.blue;
    Color textColor = isSecondary ? styles.theme.blue : styles.theme.white;
    BorderSide side = border ?? BorderSide.none;

    Widget content = _builder?.call(context) ?? child ?? const SizedBox.shrink();
    if (expand) content = Center(child: content);

    OutlinedBorder shape = circular
        ? CircleBorder(side: side)
        : RoundedRectangleBorder(side: side, borderRadius: BorderRadius.circular(styles.corners.sm));

    ButtonStyle style = ButtonStyle(
      minimumSize: ButtonStyleButton.allOrNull<Size>(minimumSize ?? Size.zero),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      splashFactory: NoSplash.splashFactory,
      backgroundColor: ButtonStyleButton.allOrNull<Color>(bgColor ?? defaultColor),
      overlayColor: ButtonStyleButton.allOrNull<Color>(Colors.transparent), // disable default press effect
      shape: ButtonStyleButton.allOrNull<OutlinedBorder>(shape),
      padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
      enableFeedback: enableFeedback,
    );

    Widget button = CustomButtonFocusBuilder(
      builder: (context, focus) => Stack(
        children: [
          TextButton(
            onPressed: onPressed,
            style: style,
            focusNode: focus,
            child: DefaultTextStyle(style: styles.text.b1.textColor(textColor), child: content),
          ),
          if (focus.hasFocus)
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(styles.corners.md),
                    border: Border.all(color: styles.theme.blue, width: 3),
                  ),
                ),
              ),
            )
        ],
      ),
    );

    // add press effect:
    if (pressEffect) button = CustomButtonEffect(button);

    // add semantics?
    if (semanticLabel == null || semanticLabel?.isEmpty == true) return button;
    return Semantics(
      label: semanticLabel,
      button: true,
      container: true,
      child: ExcludeSemantics(child: button),
    );
  }
}
