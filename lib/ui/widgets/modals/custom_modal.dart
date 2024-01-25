/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/core/core.dart';
import 'package:flutter/material.dart';

/// A route that displays a generic modal dialog centered in the screen.
class CustomModalDialogRoute<T> extends PopupRoute<T> {
  CustomModalDialogRoute({
    required this.builder,
    this.bResizeToAvoidBottomInset = false,
    this.bIsBarrierDismissible = true,
  });

  /// A function that will build the widget to display within this route.
  final Widget Function(BuildContext context) builder;

  /// If true, resize the route to stay within the bottom inset of the screen (e.g. where the OS keyboard opens on
  /// mobile devices).
  final bool bResizeToAvoidBottomInset;

  /// If true, the user can dismiss this modal by tapping outside of its body.
  final bool bIsBarrierDismissible;

  @override
  Color? get barrierColor => Colors.black38;

  @override
  bool get barrierDismissible => bIsBarrierDismissible;

  @override
  String? get barrierLabel => 'EpicCommonLocalizations.of(navigator!.context)!.modalDismissLabel';

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 100);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return CustomSingleChildLayout(
      delegate: _GenericModalDialogRouteLayout<T>(
        context: context,
        bResizeToAvoidBottomInset: bResizeToAvoidBottomInset,
      ),
      child: Center(
        child: Builder(builder: builder),
      ),
    );
  }

  /// Show a dialog using a [CustomModalDialogRoute] as the route.
  /// If [bIsBarrierDismissible] is true, the user can dismiss this modal by tapping outside of its body.
  /// Returns a future that will return the result when the dialog was popped from the navigator.
  static Future<T?> showDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool bIsBarrierDismissible = true,
  }) {
    final route = CustomModalDialogRoute<T>(
      bResizeToAvoidBottomInset: true,
      builder: builder,
      bIsBarrierDismissible: bIsBarrierDismissible,
    );

    return Navigator.of(context, rootNavigator: true).push<T>(route);
  }
}

class _GenericModalDialogRouteLayout<T> extends SingleChildLayoutDelegate {
  _GenericModalDialogRouteLayout({required this.context, required this.bResizeToAvoidBottomInset});

  final BuildContext context;

  /// If true, resize the route to stay within the bottom inset of the screen (e.g. where the OS keyboard opens on
  /// mobile devices).
  final bool bResizeToAvoidBottomInset;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    double maxHeight = double.infinity;

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    if (bResizeToAvoidBottomInset) {
      maxHeight = mediaQuery.size.height - mediaQuery.viewInsets.bottom;
    } else {
      maxHeight = mediaQuery.size.height;
    }

    return constraints.copyWith(minHeight: 0, maxHeight: maxHeight);
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

/// A generic card wrapper for a modal dialog.
class ModalDialogCard extends StatelessWidget {
  const ModalDialogCard({super.key, required this.child, this.color, this.shape});

  /// Contents of the card.
  final Widget child;

  /// Color of the card.
  final Color? color;

  /// Shape of the card.
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: context.styles.shadows.sm),
      constraints: const BoxConstraints(minWidth: 300),
      child: Card(
        shape: shape,
        color: color ?? Theme.of(context).colorScheme.surfaceTint,
        child: child,
      ),
    );
  }
}

class ModalDialogTitle extends StatelessWidget {
  const ModalDialogTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ModalDialogSection(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
          title,
        ),
      ),
    );
  }
}

class ModalDialogSection extends StatelessWidget {
  const ModalDialogSection({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: child,
    );
  }
}

class InfoModalDialog extends StatelessWidget {
  const InfoModalDialog({super.key, required this.message});

  /// The localized message to show.
  final String message;

  /// Show an info dialog in a [context] containing a [message].
  static void show(BuildContext context, String message) {
    final route = CustomModalDialogRoute(
      bResizeToAvoidBottomInset: true,
      builder: (_) => InfoModalDialog(message: message),
    );

    Navigator.of(context, rootNavigator: true).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return ModalDialogCard(
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            ModalDialogSection(
              child: Text(message),
            ),
            ModalDialogSection(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
