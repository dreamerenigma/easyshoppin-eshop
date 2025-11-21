import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';

class AddPasswordLogWalletScreen extends StatefulWidget {
  const AddPasswordLogWalletScreen({super.key});

  @override
  State<AddPasswordLogWalletScreen> createState() => _AddPasswordLogWalletScreenState();
}

class _AddPasswordLogWalletScreenState extends State<AddPasswordLogWalletScreen> {
  List<TextEditingController> controllers = List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FocusScope.of(context).requestFocus(focusNodes[0]);
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
            Text("Придумайте пароль для входа в ES Кошелёк", style: TextStyle(fontSize: TSizes.fontSizeBg, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            SizedBox(height: 8),
            Text("С ним пользоваться ES Кошельком безопаснее", style: TextStyle(fontSize: TSizes.fontSizeSm), textAlign: TextAlign.center),
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
          ],
        ),
      ),
    );
  }
}
