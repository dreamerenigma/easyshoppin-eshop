import 'package:flutter/material.dart';
import '../../../../utils/constants/app_colors.dart';

class HoverableItem extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final bool showText;

  const HoverableItem({super.key, required this.icon, required this.text, required this.onTap, this.showText = true});

  @override
  State<HoverableItem> createState() => _HoverableItemState();
}

class _HoverableItemState extends State<HoverableItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          children: [
            Icon(widget.icon, color: TColors.white),
            const SizedBox(height: 5),
            if (widget.showText)
              Text(
                widget.text,
                style: TextStyle(color: isHover ? Colors.white : TColors.textPurple, fontWeight: FontWeight.w500),
              ),
          ],
        ),
      ),
    );
  }
}
