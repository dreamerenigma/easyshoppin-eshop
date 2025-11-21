import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void setupWindow() {
  if (kIsWeb) {
  } else if (Platform.isWindows) {
    doWhenWindowReady(() {
      final win = appWindow;
      win.minSize = const Size(500, 500);
      win.size = const Size(800, 600);
      win.alignment = Alignment.center;
      win.show();
    });
  }
}
