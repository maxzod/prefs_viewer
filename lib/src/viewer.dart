import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prefs_viewer/src/page/page.dart';

class PrefsViewer {
  PrefsViewer._();

  /// * opens viewer page
  static open(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const PrefsHomePage()),
    );
  }
}
