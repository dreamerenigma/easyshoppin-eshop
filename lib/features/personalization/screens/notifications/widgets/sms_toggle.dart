import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../controllers/notification_controller.dart';

class SmsToggleWidget extends StatefulWidget {
  const SmsToggleWidget({super.key});

  @override
  SmsToggleWidgetState createState() => SmsToggleWidgetState();
}

class SmsToggleWidgetState extends State<SmsToggleWidget> {
  bool isSmsEnabled = false;

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
      Uri.parse('https://api.twilio.com/2010-04-01/Accounts/YOUR_ACCOUNT_SID/Messages.json'),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('YOUR_ACCOUNT_SID:YOUR_AUTH_TOKEN'))}',
      },
      body: {
        'From': 'YOUR_TWILIO_PHONE_NUMBER',
        'To': 'RECIPIENT_PHONE_NUMBER',
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
    const accountSid = 'YOUR_ACCOUNT_SID';
    const authToken = 'YOUR_AUTH_TOKEN';

    try {
      const userPhoneNumber = 'RECIPIENT_PHONE_NUMBER';

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
              setState(() {
                isSmsEnabled = newValue;
              });

              if (newValue) {
                NotificationController.instance.updateSmsSubscription();
              } else {

              }
            },
            activeColor: Colors.blueAccent,
            activeTrackColor: Colors.blue,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}
