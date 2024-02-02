/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

#include <flutter/runtime_effect.glsl>

uniform float uScrollbarPadding;
uniform float uStrength;
uniform float uScrollOffset;
uniform float uMaxScrollOffset;
uniform vec2 uSize;

out vec4 fragColor;

const vec4 white = vec4(1, 1, 1, 1);

// How far we can scroll away from an edge before its edge fade effect reaches full strength
const float fadeFullStrengthScrollOffset = 20.f;

// How far the fade effect extends from the edges
const float baseFadeSize = 80.f;

// The maximum fraction of the menu height that can be occupied by a single fade gradient's height.
const float maxFadeHeightFraction = 0.3f;

// The exponent applied to the fade effect's alpha
const float fadeExponent = 2.5f;

// The maximum strength of the fade effect.
const float maxStrength = 0.85f;

void main() {
    const vec2 fragCoord = FlutterFragCoord().xy;
    fragColor = white;

    // Don't fade out the scrollbar
    if (fragCoord.x > uSize.x - uScrollbarPadding) {
        return;
    }

    // Make sure fade sizes for both edges don't overlap since that causes sharp changes in opacity
    const float fadeSize = min(baseFadeSize, uSize.y * maxFadeHeightFraction);

    // Distance of fragment coord to the closest edge of the viewport
    const float edgeDistance = min(fragCoord.y, uSize.y - fragCoord.y);

    float fadeAmount = 0;

    // Increase fade effect based on scroll distance from top of menu
    if (fragCoord.y <= fadeSize) {
        fadeAmount += uScrollOffset / fadeFullStrengthScrollOffset;
    }

    // Increase fade effect based on scroll distance from bottom of menu
    if (fragCoord.y >= uSize.y - fadeSize) {
        fadeAmount += (uMaxScrollOffset - uScrollOffset) / fadeFullStrengthScrollOffset;
    }

    // How strongly to apply the fade effect based on scroll position
    const float fadeStrength = min(1.f, fadeAmount) * (uStrength * maxStrength);

    // How much to fade out the color
    const float fade = 1.f - pow(edgeDistance / fadeSize, fadeExponent);

    const float alpha = 1.f - (fade * fadeStrength);
    fragColor = alpha * white;
}
