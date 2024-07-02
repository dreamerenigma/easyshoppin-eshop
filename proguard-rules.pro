# Для Flutter SDK
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }

# Для Dart SDK
-keep class com.google.dart.**  { *; }
-keep class org.dartlang.**  { *; }
-keep class dart.**  { *; }

# Прочие правила
-keep class **.R$* { *; }
-keep class **.R { *; }
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable
