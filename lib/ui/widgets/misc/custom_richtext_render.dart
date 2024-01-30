/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'package:coca/coca.dart';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

/// A function that takes the [parentStyle] of the parent text node and returns a new style for the current node.
typedef _TextStyleBuilder = TextStyle Function(TextStyle parentStyle);

final Map<String, _TextStyleBuilder> _styleBuildersByTagName = {
  'b': (parentStyle) => parentStyle.weight(FontWeight.w700),
  'i': (parentStyle) => parentStyle.copyWith(fontStyle: FontStyle.italic),
};

final Set<String> _alreadyWarnedMissingStyleNames = {};

class CustomRichTextRender extends StatelessWidget {
  const CustomRichTextRender(this.text, {super.key, this.style});

  /// The text to parse.
  final String text;

  /// The base style for the text. If null, use the default style for the context.
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final TextStyle baseStyle = style ?? DefaultTextStyle.of(context).style;

    TextSpan textSpan;
    try {
      final XmlNode rootNode = XmlDocumentFragment.parse(text);
      textSpan = _makeTextSpanFromNode(xmlNode: rootNode, style: baseStyle);
    } catch (e) {
      textSpan = const TextSpan();
    }

    return RichText(text: textSpan);
  }

  /// Given a [xmlNode], return a text span with the appropriate style and containing spans for any of its descendants.
  /// The provided [style] will be used if the node has no associated style.
  TextSpan _makeTextSpanFromNode({required XmlNode xmlNode, required TextStyle style}) {
    if (xmlNode is XmlElement) {
      final String nodeName = xmlNode.name.toString();
      final _TextStyleBuilder? styleBuilder = _styleBuildersByTagName[nodeName];

      if (styleBuilder == null) {
        if (_alreadyWarnedMissingStyleNames.add(nodeName)) {
          //todo
        }
      } else {
        style = styleBuilder.call(style);
      }
    }

    if (xmlNode.children.isNotEmpty) {
      final childrenSpans =
          xmlNode.children.map((child) => _makeTextSpanFromNode(xmlNode: child, style: style)).toList(growable: false);

      return TextSpan(children: childrenSpans, style: style);
    }

    return TextSpan(text: xmlNode.value, style: style);
  }
}
