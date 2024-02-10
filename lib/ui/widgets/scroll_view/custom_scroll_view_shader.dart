/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'dart:ui';

import 'package:flutter/material.dart';

import 'utils/custom_scroll_view_shader_enum.dart';
import 'utils/preloadable_shader.dart';

class CustomScrollViewShader extends PreloadableShader {
  CustomScrollViewShader({required this.scrollController, required TickerProvider vsync})
      : _fadeInController =
            AnimationController(value: 0, upperBound: 1, duration: const Duration(milliseconds: 100), vsync: vsync) {
    scrollController.addListener(_updateOffset);
    _fadeInController.addListener(_updateStrength);

    // Scroll controller won't be ready immediately, so try updating and fading in the effect after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateOffset();
      _fadeInEffectIfReady();
    });
  }

  static final PreloadableShaderProgram _program = PreloadableShaderProgram('assets/shaders/scroll_view_fade.frag');

  /// The scroll controller for the corresponding scroll view.
  final ScrollController scrollController;

  /// The animation controller used to fade in the effect when ready.
  final AnimationController _fadeInController;

  /// Whether this has been disposed.
  bool _bIsDisposed = false;

  @override
  PreloadableShaderProgram get program => _program;

  /// Load or re-load the shader program.
  static Future<FragmentProgram> load() => _program.load();

  /// Unload the shader program.
  static void unload() => _program.unload();

  /// Callback function passed to a [ShaderMask] which updates the bounding rectangle.
  Shader shaderMaskCallback(Rect rect) {
    shader!.setFloat(CustomScrollViewShaderEnum.sizeX.index, rect.width);
    shader!.setFloat(CustomScrollViewShaderEnum.sizeY.index, rect.height);

    return shader!;
  }

  @override
  void dispose() {
    super.dispose();

    if (_bIsDisposed) {
      return;
    }

    scrollController.removeListener(_updateOffset);
    _fadeInController.dispose();
    _bIsDisposed = true;
  }

  @override
  void initUniforms() {
    shader!.setFloat(CustomScrollViewShaderEnum.barPadding.index, 24);
    _updateStrength();
    _updateOffset();
  }

  /// Fade in the effect if it hasn't already and the scroll controller is ready to be accessed.
  void _fadeInEffectIfReady() {
    if (_bIsDisposed ||
        _fadeInController.isCompleted ||
        _fadeInController.isAnimating ||
        scrollController.positions.isEmpty) {
      return;
    }

    _fadeInController.animateTo(1.0);
  }

  /// Update the effect's strength based on the fade in animation.
  void _updateStrength() {
    shader!.setFloat(CustomScrollViewShaderEnum.strength.index, _fadeInController.value);
  }

  /// Update the shader's properties based on the [scrollController]'s position.
  void _updateOffset() {
    if (scrollController.positions.isEmpty) {
      return;
    }

    _fadeInEffectIfReady();

    shader!.setFloat(CustomScrollViewShaderEnum.scrollOffset.index, scrollController.offset);
    shader!.setFloat(CustomScrollViewShaderEnum.maxScrollOffset.index, scrollController.position.maxScrollExtent);
  }
}
