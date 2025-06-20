/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../coca.dart';

class OtpInput extends StatefulWidget {
  const OtpInput({super.key});

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends BaseStatefulWidget<OtpInput> {
  final pinController = TextEditingController();

  final focusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: styles.text.t1,
      decoration: BoxDecoration(
        borderRadius: styles.corners.br32,
        border: Border.all(color: grey.shade300),
        color: grey.shade200,
      ),
    );

    return Form(
      key: formKey,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Pinput(
          controller: pinController,
          focusNode: focusNode,
          defaultPinTheme: defaultPinTheme,
          separatorBuilder: (index) => const SizedBox(width: 8),
          validator: (value) {
            return value == '2222' ? null : 'Pin is incorrect';
          },
          onClipboardFound: (value) {
            debugPrint('onClipboardFound: $value');
            pinController.setText(value);
          },
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          onCompleted: (pin) {
            debugPrint('onCompleted: $pin');
          },
          onChanged: (value) {
            debugPrint('onChanged: $value');
          },
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  width: 22,
                  height: 1,
                  color: styles.theme.blue),
            ],
          ),
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              border: Border.all(color: styles.theme.blue),
              color: styles.theme.white,
            ),
          ),
          submittedPinTheme: defaultPinTheme,
          errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.redAccent)),
        ),
      ),
    );
  }
}
