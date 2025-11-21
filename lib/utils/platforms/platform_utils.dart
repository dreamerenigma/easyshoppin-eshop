import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

/// Безопасная проверка: это Windows (кроме Web)?
bool get isWindows => !kIsWeb && Platform.isWindows;

/// Безопасная проверка: это Android?
bool get isAndroid => !kIsWeb && Platform.isAndroid;

/// Безопасная проверка: это iOS?
bool get isIOS => !kIsWeb && Platform.isIOS;

/// Безопасная проверка: это мобильное устройство?
bool get isMobile => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

/// Проверка: Web или Windows
bool get isWebOrWindows => kIsWeb || (!kIsWeb && Platform.isWindows);

/// Проверка: это Web или мобильное устройство?
bool get isWebOrMobile => kIsWeb || (!kIsWeb && (Platform.isAndroid || Platform.isIOS));
