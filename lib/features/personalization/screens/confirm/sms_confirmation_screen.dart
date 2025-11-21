import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../models/user_model.dart';

class SmsConfirmationScreen extends StatefulWidget {
  final UserModel user;

  const SmsConfirmationScreen({super.key, required this.user});

  @override
  SmsConfirmationScreenState createState() => SmsConfirmationScreenState();
}

class SmsConfirmationScreenState extends State<SmsConfirmationScreen> {
  List<TextEditingController> controllers = List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  String _timerText = "00:30";
  bool canRequestAgain = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FocusScope.of(context).requestFocus(focusNodes[0]);
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_timerText == "00:00") {
        setState(() {
          canRequestAgain = true;
        });
        return;
      }

      final minutes = int.parse(_timerText.substring(0, 2));
      final seconds = int.parse(_timerText.substring(3, 5));

      if (seconds > 0) {
        setState(() {
          _timerText = "${minutes.toString().padLeft(2, '0')}:${(seconds - 1).toString().padLeft(2, '0')}";
        });
      } else if (minutes > 0) {
        setState(() {
          _timerText = "${(minutes - 1).toString().padLeft(2, '0')}:59";
        });
      }

      _startTimer();
    });
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.bg, vertical: TSizes.mg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Введите код из смс", style: TextStyle(fontSize: TSizes.fontSizeBg, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Отправили на ${widget.user.phoneNumber}", style: TextStyle(fontSize: TSizes.fontSizeMd)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Row(
                  children: [
                    Container(
                      width: 45,
                      height: 55,
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      alignment: Alignment.center,
                      child: TextSelectionTheme(
                        data: TextSelectionThemeData(
                          cursorColor: TColors.blue,
                          selectionColor: TColors.blue.withAlpha((0.3 * 255).toInt()),
                          selectionHandleColor: TColors.blue,
                        ),
                        child: TextField(
                          controller: controllers[index],
                          focusNode: focusNodes[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            contentPadding: EdgeInsets.only(left: 4, bottom: 12, top: 12),
                            fillColor: TColors.buttonDarkGrey.withAlpha((0.4 * 255).toInt()),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: TColors.blue),
                            ),
                          ),
                          style: TextStyle(fontSize: TSizes.fontSizeXl),
                          onChanged: (value) => _onChanged(value, index),
                        ),
                      ),
                    ),
                    if (index == 2) SizedBox(width: 12),
                  ],
                );
              }),
            ),
            SizedBox(height: 14),
            Text("Запросить код можно повторно через $_timerText", style: TextStyle(fontSize: TSizes.fontSizeMd)),
          ],
        ),
      ),
    );
  }
}
