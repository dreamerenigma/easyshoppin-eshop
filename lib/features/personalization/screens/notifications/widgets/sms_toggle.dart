import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../../utils/constants/app_colors.dart';
import '../../../controllers/notification_controller.dart';

class SmsToggleWidget extends StatefulWidget {
  const SmsToggleWidget({super.key});

  @override
  SmsToggleWidgetState createState() => SmsToggleWidgetState();
}

class SmsToggleWidgetState extends State<SmsToggleWidget> {
  bool isSmsEnabled = false;
  final userPhoneNumber = dotenv.env['USER_PHONE_NUMBER']!;
  final accountSid = dotenv.env['TWILIO_ACCOUNT_SID']!;
  final authToken = dotenv.env['TWILIO_AUTH_TOKEN']!;
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    loadSmsPreference();
  }

  void loadSmsPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSmsEnabled = prefs.getBool('isSmsEnabled') ?? false;
    });
  }

  void toggleSms(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSmsEnabled = value;
      prefs.setBool('isSmsEnabled', value);
    });

    if (isSmsEnabled) {
      enableSmsNotifications();
    } else {
      disableSmsNotifications();
    }
  }

  void enableSmsNotifications() async {
    final response = await http.post(
      Uri.parse('https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json'),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('$accountSid:$authToken'))}',
      },
      body: {
        'From': '+12059315284',
        'To': userPhoneNumber,
        'Body': 'Вы подписались на рекламные SMS-уведомления',
      },
    );

    if (response.statusCode == 201) {
      logger.d('SMS отправлено успешно');
    } else {
      logger.d('Ошибка при отправке SMS: ${response.reasonPhrase}');
    }
  }

  void disableSmsNotifications() async {
    try {
      final response = await http.post(
        Uri.parse('https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json'),
        headers: {
          'Authorization': 'Basic ${base64Encode(utf8.encode('$accountSid:$authToken'))}',
        },
        body: {
          'To': userPhoneNumber,
          'Body': 'Отключение рекламных SMS уведомлений. Если это не вы, пожалуйста, обратитесь в поддержку.',
        },
      );

      if (response.statusCode == 201) {
        logger.d('SMS для отключения отправлено успешно');
      } else {
        logger.d('Ошибка при отправке SMS для отключения: ${response.reasonPhrase}');
      }
    } catch (e) {
      logger.e('Ошибка при попытке отключить SMS уведомления: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.8,
          child: Switch(
            value: isSmsEnabled,
            onChanged: (newValue) {
              toggleSms(newValue);
              if (newValue) {
                NotificationController.instance.updateSmsSubscription();
              } else {
                // Для отключения можно выполнить дополнительные действия
              }
            },
            activeThumbColor: Colors.blueAccent.withAlpha((0.5 * 255).toInt()),
            activeTrackColor: TColors.blue,
            inactiveThumbColor: TColors.grey,
            inactiveTrackColor: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}
