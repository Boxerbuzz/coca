/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import '../../../../coca.dart';
import 'premium_card.dart';

class PremiumCarousel extends StatefulWidget {
  const PremiumCarousel({super.key, required this.items, this.onChange});
  final List<PremiumModel> items;
  final Function? onChange;

  @override
  State<PremiumCarousel> createState() => _PremiumCarouselState();
}

class _PremiumCarouselState extends State<PremiumCarousel> with SingleTickerProviderStateMixin {
  final double _maxRotation = 30;

  late PageController _pageController;

  late double _cardWidth;
  late double _cardHeight;
  double _normalizedOffset = 0;
  double _prevScrollX = 0;
  bool _isScrolling = false;

  AnimationController? _tweenController;
  Tween<double>? _tween;
  Animation<double>? _tweenAnim;

  @override
  void dispose() {
    _tweenController?.dispose();
    _pageController.dispose();
    _tweenAnim?.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _cardHeight = (context.heightPct(.6));
    _cardWidth = context.widthPct(.8);
    _pageController = PageController(initialPage: 2, viewportFraction: _cardWidth / context.widthPx, keepPage: false);

    Widget listContent = SizedBox(
      height: _cardHeight,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        itemCount: widget.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => _renderCard(i),
      ),
    );

    return Listener(
      onPointerUp: _handlePointerUp,
      child: NotificationListener(
        onNotification: _handleScrollNotifications,
        child: listContent,
      ),
    );
  }

  Widget _renderCard(int itemIndex) {
    return CustomRotationTD(
      rotationY: _normalizedOffset * _maxRotation,
      child: PremiumCard(data: widget.items[itemIndex % widget.items.length]),
    );
  }

  bool _handleScrollNotifications(Notification notification) {
    if (notification is ScrollUpdateNotification) {
      if (_isScrolling) {
        double dx = notification.metrics.pixels - _prevScrollX;
        double scrollFactor = .01;
        double newOffset = (_normalizedOffset + dx * scrollFactor);
        _setOffset(newOffset.clamp(-1.0, 1.0));
      }
      _prevScrollX = notification.metrics.pixels;
      widget.onChange!(widget.items.elementAt(_pageController.page!.round() % widget.items.length));
    }
    //Scroll Start
    else if (notification is ScrollStartNotification) {
      _isScrolling = true;
      _prevScrollX = notification.metrics.pixels;
      if (_tween != null) {
        _tweenController?.stop();
      }
    }
    return true;
  }

  void _handlePointerUp(PointerUpEvent event) {
    if (_isScrolling) {
      _isScrolling = false;
      _startOffsetTweenToZero();
    }
  }

  void _setOffset(double value) => setState(() => _normalizedOffset = value);

  void _startOffsetTweenToZero() {
    int tweenTime = 1000;
    if (_tweenController == null) {
      _tweenController = AnimationController(vsync: this, duration: tweenTime.milliseconds);
      _tween = Tween<double>(begin: -1, end: 0);
      _tweenAnim = _tween?.animate(CurvedAnimation(parent: _tweenController!, curve: Curves.elasticOut));
      _tweenAnim?.addListener(() => _setOffset(_tweenAnim!.value));
    }
    _tween?.begin = _normalizedOffset;
    _tweenController?.reset();
    _tween?.end = 0;
    _tweenController?.forward();
  }
}
