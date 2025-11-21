import 'package:flutter/material.dart';

class HoverIconButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color normalColor;
  final Color hoverColor;
  final double size;
  final Duration duration;

  const HoverIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.normalColor,
    required this.hoverColor,
    this.size = 24,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  HoverIconButtonState createState() => HoverIconButtonState();
}

class HoverIconButtonState extends State<HoverIconButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: TweenAnimationBuilder(
          tween: ColorTween(begin: widget.normalColor, end: isHovered ? widget.hoverColor : widget.normalColor),
          duration: widget.duration,
          builder: (context, color, _) {
            return Icon(
              widget.icon,
              color: color,
              size: widget.size,
            );
          },
        ),
      ),
    );
  }
}
