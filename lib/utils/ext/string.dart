import 'dart:convert';

import 'package:mtodolist/core/core.dart';

extension StringExtension on String {

  String toLocale() {
    try {
      final data = jsonDecode(sl<PrefManager>().text) as Map<dynamic, dynamic>;
      return data[this] as String;
    } catch (e) {
      return "key $this is not registered";
    }
  }
}
