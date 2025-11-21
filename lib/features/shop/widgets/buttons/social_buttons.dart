import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import '../../../../utils/constants/app_colors.dart';

class SocialButton extends StatefulWidget {
  final String assetPath;
  final VoidCallback onTap;

  const SocialButton({super.key, required this.assetPath, required this.onTap});

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final backgroundColor = isHovered ? (isDark ? TColors.deepNight : TColors.youngNight) : (isDark ? TColors.cardColor : TColors.grey);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 70,
          height: 48,
          decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(12)),
          child: Center(child: SvgPicture.asset(widget.assetPath, width: 24, height: 24)),
        ),
      ),
    );
  }
}
