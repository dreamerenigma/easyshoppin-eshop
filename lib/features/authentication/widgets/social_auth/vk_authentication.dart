import 'dart:async';
import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';

class VKAuth {
  static Future<String?> signInWithVK({
    required String clientId,
    List<String> scope = const ['email'],
  }) async {
    final redirectUri = 'https://light-frogs-train.loca.lt';

    final authUrl = Uri.https('oauth.vk.com', '/authorize', {
      'client_id': clientId,
      'display': 'page',
      'redirect_uri': redirectUri,
      'scope': scope.join(','),
      'response_type': 'token',
      'v': '5.199',
    });

    final completer = Completer<String?>();

    if (!await launchUrl(authUrl)) {
      throw 'Could not launch $authUrl';
    }

    log('Открыл браузер для VK авторизации. Токен придет в fragment после редиректа на $redirectUri');
    final token = await completer.future;
    log('VK token: $token');
    return token;
  }
}
