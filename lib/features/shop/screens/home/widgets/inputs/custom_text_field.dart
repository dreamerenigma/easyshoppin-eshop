import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_sizes.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();
  bool hasText = false;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        hasText = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = isHovered ? (context.isDarkMode ? TColors.white : TColors.black) : TColors.transparent;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: TextSelectionTheme(
        data: TextSelectionThemeData(
          cursorColor: TColors.blue,
          selectionColor: TColors.blue.withAlpha((0.3 * 255).toInt()),
          selectionHandleColor: TColors.blue,
        ),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Ваша почта или телефон',
            labelText: hasText ? 'Ваша почта или телефон' : null,
            filled: true,
            hintStyle: TextStyle(fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w300),
            fillColor: context.isDarkMode ? TColors.cardColor : Colors.grey[200],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: borderColor, width: 1)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: borderColor, width: 1)),
            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: borderColor, width: 1)),
            disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: borderColor, width: 1)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          style: TextStyle(fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
