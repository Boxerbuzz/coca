/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/coca.dart';
import 'package:flutter/material.dart';

void main() => runApp(app);

const Widget app = MaterialApp(home: Scaffold(body: CustomSwitch()));

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key, this.width, this.height});

  final double? height;
  final double? width;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool onTapState = false;
  bool toggleState = false;
  static const Color colorRed = Colors.red;
  static const Color colorGreen = Color(0xff46E387);

  void _handleTap(bool newState) {
    setState(() {
      onTapState = newState;
    });
  }

  void _handleToggle() {
    setState(() {
      toggleState = !toggleState;
    });
  }

  Widget _styledBox({required Widget child, required bool tapState, required bool toggleState}) {
    return Transform.scale(
      scale: tapState ? 0.95 : 1,
      child: Container(
        decoration: BoxDecoration(
          color: toggleState ? colorGreen : colorRed,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: toggleState ? colorGreen.withOpacity(0.3) : colorRed.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: child
              .padding(all: 10)
              .constrained(height: 50, width: 90)
              .ripple(splashColor: Colors.white.withOpacity(0.1)),
        ),
      ),
    );
  }

  Widget _styledOuterCircle({required Widget child, required bool toggleState}) {
    return Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)), child: child)
        .constrained(width: toggleState ? 10 : 30, height: 30, animate: true)
        .padding(right: toggleState ? 10 : 0, animate: true)
        .alignment(toggleState ? Alignment.centerRight : Alignment.centerLeft, animate: true);
  }

  Widget _styledInnerCircle({required bool toggleState}) {
    return Container(
      decoration: BoxDecoration(color: toggleState ? colorGreen : colorRed, borderRadius: BorderRadius.circular(6)),
    ).constrained(width: toggleState ? 0 : 12, height: 12, animate: true).alignment(Alignment.center);
  }

  @override
  Widget build(BuildContext context) {
    return _styledInnerCircle(toggleState: toggleState)
        .parent(({required Widget child}) => _styledOuterCircle(child: child, toggleState: toggleState))
        .parent(({required Widget child}) => _styledBox(child: child, tapState: onTapState, toggleState: toggleState))
        .gestures(onTapChange: _handleTap, onTap: _handleToggle)
        .alignment(Alignment.center)
        .animate(const Duration(milliseconds: 300), Curves.easeOut);
  }
}
