/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'custom_scroll_view_shader.dart';

class CustomScrollViewWithFade extends StatefulWidget {
  const CustomScrollViewWithFade({super.key, required this.child});
  final Widget child;

  static Future preloadShaders() => CustomScrollViewShader.load();
  static void unloadShaders() => CustomScrollViewShader.unload();

  @override
  State<CustomScrollViewWithFade> createState() => _CustomScrollViewWithFadeState();
}

class _CustomScrollViewWithFadeState extends State<CustomScrollViewWithFade> with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  late final CustomScrollViewShader shader;

  @override
  void initState() {
    super.initState();
    shader = CustomScrollViewShader(scrollController: _controller, vsync: this);
  }

  @override
  void dispose() {
    shader.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      removeTop: true,
      child: ShaderMask(
        shaderCallback: shader.shaderMaskCallback,
        blendMode: BlendMode.modulate,
        child: SingleChildScrollView(controller: _controller, child: widget.child),
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();

    shader.reload();
  }
}

Future loadShaders() async {
  await CustomScrollViewWithFade.preloadShaders();
}
