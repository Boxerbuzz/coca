/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';

typedef KeyboardTapCallback = void Function(String text);

class OtpScreenKeyboard extends StatefulWidget {
  /// Color of the text [default = Colors.black]
  final TextStyle? textStyle;

  /// Display a custom right icon
  final Widget? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Action to trigger when right button is long pressed
  final Function()? rightButtonLongPressFn;

  /// Display a custom left icon
  final Widget? leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  const OtpScreenKeyboard(
      {super.key,
      required this.onKeyboardTap,
      this.textStyle,
      this.rightButtonFn,
      this.rightButtonLongPressFn,
      this.rightIcon,
      this.leftButtonFn,
      this.leftIcon,
      this.mainAxisAlignment = MainAxisAlignment.spaceBetween});

  @override
  State<StatefulWidget> createState() {
    return _OtpScreenKeyboardState();
  }
}

class _OtpScreenKeyboardState extends BaseStatefulWidget<OtpScreenKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _button('1'),
              _button('2'),
              _button('3'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _button('4'),
              _button('5'),
              _button('6'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _button('7'),
              _button('8'),
              _button('9'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: widget.leftButtonFn,
                  child: Container(alignment: Alignment.center, width: 50, height: 50, child: widget.leftIcon)),
              _button('0'),
              InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: widget.rightButtonFn,
                  onLongPress: widget.rightButtonLongPressFn,
                  child: Container(alignment: Alignment.center, width: 50, height: 50, child: widget.rightIcon))
            ],
          ),
        ],
      ),
    );
  }

  Widget _button(String value) {
    return InkWell(
      borderRadius: BorderRadius.circular(45),
      onTap: () {
        widget.onKeyboardTap(value);
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          value,
          style: widget.textStyle ?? styles.text.h3,
        ),
      ),
    );
  }
}
