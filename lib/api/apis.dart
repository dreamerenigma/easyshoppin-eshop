import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class APIs {
  /// -- Authentication.
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> signInWithYandex({VoidCallback? onSuccess}) async {
    final clientId = "e73f69f6b2d54b99929c2bf41ef761e6";
    final redirectUri = Platform.isWindows || Platform.isLinux || Platform.isMacOS ? "http://localhost:8080" : "com.inputstudios.easyshoppin_eshop://auth";
    final authUrl = "https://oauth.yandex.ru/authorize?response_type=token&client_id=$clientId&redirect_uri=$redirectUri";
    final result = await FlutterWebAuth2.authenticate(
      url: authUrl,
      callbackUrlScheme: Platform.isWindows || Platform.isLinux || Platform.isMacOS ? "http" : "com.inputstudios.easyshoppin_eshop",
    );
    final token = Uri.parse(result).fragment.split('&').firstWhere((e) => e.startsWith("access_token")).split("=")[1];

    log("Yandex token: $token");

    if (onSuccess != null) {
      onSuccess();
    }
  }
}
