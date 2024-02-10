/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../haptics.dart';

extension WidgetExtension on Widget {
  Widget clickable(void Function()? action, {bool opaque = true}) {
    return GestureDetector(
      behavior: opaque ? HitTestBehavior.opaque : HitTestBehavior.deferToChild,
      onTap: () {
        AppHaptics.buttonPress();
        action?.call();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        opaque: opaque,
        child: this,
      ),
    );
  }

  _StyledAnimatedModel _getAnimation(BuildContext context) {
    _StyledAnimatedModel? animation = _StyledInheritedAnimation.of(context)?.animation;
    assert(animation != null,
        '[styled_widget]: You can`t animate without defining the animation. Call the method animate() higher in your widget hierarchy to define an animation');
    return animation!;
  }

  /// animated all properties before this method
  Widget animate(Duration duration, Curve curve) => _StyledInheritedAnimation(
        animation: _StyledAnimatedModel(duration: duration, curve: curve),
        child: this,
      );

  Widget fractionallySizedBox({AlignmentGeometry alignment = Alignment.center, double? wFactor, double? hFactor}) =>
      FractionallySizedBox(
        alignment: alignment,
        widthFactor: wFactor,
        heightFactor: hFactor,
        child: this,
      );

  Widget alignment(AlignmentGeometry alignment, {bool animate = false}) => animate
      ? Builder(
          builder: (BuildContext context) {
            _StyledAnimatedModel animation = _getAnimation(context);
            return AnimatedAlign(
              alignment: alignment,
              duration: animation.duration,
              curve: animation.curve,
              child: this,
            );
          },
        )
      : Align(alignment: alignment, child: this);

  Widget width(double width, {bool animate = false}) => animate
      ? _StyledAnimatedBuilder(
          builder: (animation) {
            return _AnimatedConstrainedBox(
              constraints: BoxConstraints.tightFor(width: width),
              duration: animation.duration,
              curve: animation.curve,
              child: this,
            );
          },
        )
      : ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: width),
          child: this,
        );

  Widget height(double height, {bool animate = false}) => animate
      ? _StyledAnimatedBuilder(
          builder: (animation) {
            return _AnimatedConstrainedBox(
              key: key,
              constraints: BoxConstraints.tightFor(height: height),
              duration: animation.duration,
              curve: animation.curve,
              child: this,
              onEnd: () {},
            );
          },
        )
      : ConstrainedBox(
          constraints: BoxConstraints.tightFor(height: height),
          child: this,
        );

  Widget padding(
          {double? all,
          double? horizontal,
          double? vertical,
          double? top,
          double? bottom,
          double? left,
          double? right,
          bool animate = false}) =>
      animate
          ? Builder(
              builder: (BuildContext context) {
                _StyledAnimatedModel animation = _getAnimation(context);
                return AnimatedPadding(
                    padding: EdgeInsets.only(
                        top: top ?? vertical ?? all ?? 0.0,
                        bottom: bottom ?? vertical ?? all ?? 0.0,
                        left: left ?? horizontal ?? all ?? 0.0,
                        right: right ?? horizontal ?? all ?? 0.0),
                    duration: animation.duration,
                    curve: animation.curve,
                    child: this);
              },
            )
          : Padding(
              padding: EdgeInsets.only(
                  top: top ?? vertical ?? all ?? 0.0,
                  bottom: bottom ?? vertical ?? all ?? 0.0,
                  left: left ?? horizontal ?? all ?? 0.0,
                  right: right ?? horizontal ?? all ?? 0.0),
              child: this,
            );

  Widget ripple(
          {Color? focusColor,
          Color? hoverColor,
          Color? highlightColor,
          Color? splashColor,
          InteractiveInkFeatureFactory? splashFactory,
          double? radius,
          ShapeBorder? customBorder,
          bool enableFeedback = true,
          bool excludeFromSemantics = false,
          FocusNode? focusNode,
          bool canRequestFocus = true,
          bool autoFocus = false}) =>
      Builder(
        builder: (BuildContext context) {
          // TODO: PERFORMANCE: findAncestorWidgetOfExactType vs InheritedWidget performance
          GestureDetector? gestures = context.findAncestorWidgetOfExactType<GestureDetector>();
          return Material(
            color: Colors.transparent,
            child: InkWell(
              focusColor: focusColor,
              hoverColor: hoverColor,
              highlightColor: highlightColor,
              splashColor: splashColor,
              splashFactory: splashFactory,
              radius: radius,
              customBorder: customBorder,
              enableFeedback: enableFeedback,
              excludeFromSemantics: excludeFromSemantics,
              focusNode: focusNode,
              canRequestFocus: canRequestFocus,
              autofocus: autoFocus,
              onTap: gestures?.onTap,
              child: this,
            ),
          );
        },
      );

  Widget gestures({
    GestureOnTapChangeCallback? onTapChange,
    GestureTapDownCallback? onTapDown,
    GestureTapUpCallback? onTapUp,
    GestureTapCallback? onTap,
    GestureTapCancelCallback? onTapCancel,
    GestureTapDownCallback? onSecondaryTapDown,
    GestureTapUpCallback? onSecondaryTapUp,
    GestureTapCancelCallback? onSecondaryTapCancel,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
    GestureLongPressStartCallback? onLongPressStart,
    GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    GestureLongPressUpCallback? onLongPressUp,
    GestureLongPressEndCallback? onLongPressEnd,
    GestureDragDownCallback? onVerticalDragDown,
    GestureDragStartCallback? onVerticalDragStart,
    GestureDragUpdateCallback? onVerticalDragUpdate,
    GestureDragEndCallback? onVerticalDragEnd,
    GestureDragCancelCallback? onVerticalDragCancel,
    GestureDragDownCallback? onHorizontalDragDown,
    GestureDragStartCallback? onHorizontalDragStart,
    GestureDragUpdateCallback? onHorizontalDragUpdate,
    GestureDragEndCallback? onHorizontalDragEnd,
    GestureDragCancelCallback? onHorizontalDragCancel,
    GestureDragDownCallback? onPanDown,
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
    GestureDragCancelCallback? onPanCancel,
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureScaleEndCallback? onScaleEnd,
    GestureForcePressStartCallback? onForcePressStart,
    GestureForcePressPeakCallback? onForcePressPeak,
    GestureForcePressUpdateCallback? onForcePressUpdate,
    GestureForcePressEndCallback? onForcePressEnd,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      GestureDetector(
        onTapDown: (TapDownDetails tapDownDetails) {
          if (onTapDown != null) onTapDown(tapDownDetails);
          if (onTapChange != null) onTapChange(true);
        },
        onTapCancel: () {
          if (onTapCancel != null) onTapCancel();
          if (onTapChange != null) onTapChange(false);
        },
        onTap: () {
          if (onTap != null) onTap();
          if (onTapChange != null) onTapChange(false);
        },
        onTapUp: onTapUp,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        onLongPressStart: onLongPressStart,
        onLongPressEnd: onLongPressEnd,
        onLongPressMoveUpdate: onLongPressMoveUpdate,
        onLongPressUp: onLongPressUp,
        onVerticalDragStart: onVerticalDragStart,
        onVerticalDragEnd: onVerticalDragEnd,
        onVerticalDragDown: onVerticalDragDown,
        onVerticalDragCancel: onVerticalDragCancel,
        onVerticalDragUpdate: onVerticalDragUpdate,
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragEnd: onHorizontalDragEnd,
        onHorizontalDragCancel: onHorizontalDragCancel,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onHorizontalDragDown: onHorizontalDragDown,
        onForcePressStart: onForcePressStart,
        onForcePressEnd: onForcePressEnd,
        onForcePressPeak: onForcePressPeak,
        onForcePressUpdate: onForcePressUpdate,
        onPanStart: onPanStart,
        onPanEnd: onPanEnd,
        onPanCancel: onPanCancel,
        onPanDown: onPanDown,
        onPanUpdate: onPanUpdate,
        onScaleStart: onScaleStart,
        onScaleEnd: onScaleEnd,
        onScaleUpdate: onScaleUpdate,
        behavior: behavior,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
        child: this,
      );

  Widget constrained(
      {double? width,
      double? height,
      double minWidth = 0.0,
      double maxWidth = double.infinity,
      double minHeight = 0.0,
      double maxHeight = double.infinity,
      bool animate = false}) {
    BoxConstraints constraints = BoxConstraints(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
    constraints = (width != null || height != null) ? constraints.tighten(width: width, height: height) : constraints;
    return animate
        ? _StyledAnimatedBuilder(builder: (animation) {
            return _AnimatedConstrainedBox(
                constraints: constraints, duration: animation.duration, curve: animation.curve, child: this);
          })
        : ConstrainedBox(constraints: constraints, child: this);
  }

  Widget opacity(double opacity, {bool animate = false, bool alwaysIncludeSemantics = false}) => animate
      ? _StyledAnimatedBuilder(builder: (animation) {
          return AnimatedOpacity(
              opacity: opacity,
              alwaysIncludeSemantics: alwaysIncludeSemantics,
              duration: animation.duration,
              curve: animation.curve,
              child: this);
        })
      : Opacity(opacity: opacity, alwaysIncludeSemantics: alwaysIncludeSemantics, child: this);

  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) => Flexible(flex: flex, fit: fit, child: this);
}

class _StyledInheritedAnimation extends InheritedWidget {
  final _StyledAnimatedModel? animation;

  const _StyledInheritedAnimation({this.animation, required super.child});

  @override
  bool updateShouldNotify(_StyledInheritedAnimation oldAnimation) =>
      !(oldAnimation.animation?.duration == animation?.duration && oldAnimation.animation?.curve == animation?.curve);

  static _StyledInheritedAnimation? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_StyledInheritedAnimation>();
}

class _AnimatedConstrainedBox extends ImplicitlyAnimatedWidget {
  /// The [curve] and [duration] arguments must not be null.
  _AnimatedConstrainedBox({super.key, this.constraints, this.child, super.curve, required super.duration, super.onEnd})
      : assert(constraints == null || constraints.debugAssertIsValid());

  /// The [child] contained by the container.
  ///
  /// If null, and if the [constraints] are unbounded or also null, the
  /// container will expand to fill all available space in its parent, unless
  /// the parent provides unbounded constraints, in which case the container
  /// will attempt to be as small as possible.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  /// Additional constraints to apply to the child.
  ///
  /// The constructor `width` and `height` arguments are combined with the
  /// `constraints` argument to set this property.
  ///
  /// The [padding] goes inside the constraints.
  final BoxConstraints? constraints;

  @override
  _AnimatedConstrainedBoxState createState() => _AnimatedConstrainedBoxState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<BoxConstraints>('constraints', constraints, defaultValue: null, showName: false));
  }
}

class _StyledAnimatedBuilder extends StatelessWidget {
  const _StyledAnimatedBuilder({required this.builder});

  final Widget Function(_StyledAnimatedModel) builder;

  @override
  Widget build(BuildContext context) {
    _StyledAnimatedModel? animation = _StyledInheritedAnimation.of(context)?.animation;
    assert(
      animation != null,
      '[styled_widget]: Tried to animate a widget without an animation specified. Define your animation using .animate() as an ancestor of the widget you are trying to animate',
    );
    return builder(animation!);
  }
}

class _AnimatedConstrainedBoxState extends AnimatedWidgetBaseState<_AnimatedConstrainedBox> {
  BoxConstraintsTween? _constraints;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _constraints = visitor(
            _constraints, widget.constraints, (dynamic value) => BoxConstraintsTween(begin: value as BoxConstraints))
        as BoxConstraintsTween;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: _constraints?.evaluate(animation) ?? const BoxConstraints(),
      child: widget.child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(
        DiagnosticsProperty<BoxConstraintsTween>('constraints', _constraints, showName: false, defaultValue: null));
  }
}

class _StyledAnimatedModel {
  final Duration duration;
  final Curve curve;
  _StyledAnimatedModel({
    required this.duration,
    this.curve = Curves.linear,
  });
}

typedef GestureOnTapChangeCallback = void Function(bool tapState);
