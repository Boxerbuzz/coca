/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    } else {
      return '${this[0].toUpperCase()}${substring(1)}';
    }
  }
}
