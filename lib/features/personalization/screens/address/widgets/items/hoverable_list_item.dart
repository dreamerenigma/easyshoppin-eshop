import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import '../../../../../../utils/constants/app_colors.dart';

class HoverableListItem extends StatefulWidget {
  final Widget child;

  const HoverableListItem({super.key, required this.child});

  @override
  State<HoverableListItem> createState() => HoverableListItemState();
}

class HoverableListItemState extends State<HoverableListItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isHovered ? (context.isDarkMode ? TColors.steelGrey.withAlpha(120) : TColors.grey.withAlpha(120)) : TColors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
