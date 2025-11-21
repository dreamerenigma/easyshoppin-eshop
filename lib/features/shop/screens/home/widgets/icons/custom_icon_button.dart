import 'package:flutter/material.dart';
import '../../../../../../utils/constants/app_colors.dart';

class CustomIconButton extends StatefulWidget {
  final double size;

  const CustomIconButton({
    super.key,
    this.size = 40,
  });

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool _isHovering = false;
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          setState(() => _isOpen = !_isOpen);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: TColors.transparent,
            border: Border.all(color: _isHovering ? Colors.white : TColors.steelGrey, width: 1),
            borderRadius: BorderRadius.circular(18),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutBack,
                ),
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            child: SizedBox(
              key: ValueKey(_isOpen),
              width: widget.size,
              height: widget.size,
              child: Center(
                child: Icon(
                  _isOpen ? Icons.close_rounded : Icons.menu_rounded,
                  color: TColors.white,
                  size: _isOpen ? widget.size - 6 : widget.size - 4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
