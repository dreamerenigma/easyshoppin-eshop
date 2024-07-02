import 'dart:io';

void main() {
  final localProperties = File('android/local.properties').readAsLinesSync();
  final versionCode = localProperties.firstWhere((line) => line.startsWith('flutter.versionCode')).split('=')[1].trim();
  final versionName = localProperties.firstWhere((line) => line.startsWith('flutter.versionName')).split('=')[1].trim();

  final content = '''
const String appVersionCode = '$versionCode';
const String appVersionName = '$versionName';
''';

  File('lib/generated/version.dart').writeAsStringSync(content);
}
