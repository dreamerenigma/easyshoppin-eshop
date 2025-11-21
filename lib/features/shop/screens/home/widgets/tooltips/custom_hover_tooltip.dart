import 'package:flutter/material.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_sizes.dart';

class CustomHoverTooltip extends StatefulWidget {
  final Widget child;
  final String message;
  final double offsetX;
  final double offsetY;
  final bool showTriangle;

  const CustomHoverTooltip({
    super.key,
    required this.child,
    required this.message,
    this.offsetX = 0,
    this.offsetY = 0,
    this.showTriangle = true,
  });

  @override
  State<CustomHoverTooltip> createState() => _CustomHoverTooltipState();
}

class _CustomHoverTooltipState extends State<CustomHoverTooltip> {
  bool _isHovering = false;
  OverlayEntry? _overlayEntry;

  void _showTooltip() {
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: offset.dx + size.width / 2 + widget.offsetX,
          top: offset.dy + widget.offsetY,
          child: Material(
            color: TColors.transparent,
            child: Column(
              children: [
                if (widget.showTriangle)
                  CustomPaint(painter: _TrianglePainter(offsetY: 1), child: const SizedBox(width: 20, height: 12)),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: TColors.black.withAlpha((0.3 * 255).toInt()),
                        offset: Offset(0, 2),
                        blurRadius: 6,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Text(widget.message, style: const TextStyle(color: TColors.white, fontSize: TSizes.fontSizeSm)),
                ),
              ],
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovering = true);
        _showTooltip();
      },
      onExit: (_) {
        setState(() => _isHovering = false);
        _hideTooltip();
      },
      child: TweenAnimationBuilder<Color?>(
        tween: ColorTween(
          begin: TColors.buttonDisabled,
          end: _isHovering ? TColors.blue : TColors.buttonDisabled,
        ),
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        builder: (context, color, child) {
          return IconTheme(
            data: IconThemeData(color: color, size: 30),
            child: child!,
          );
        },
        child: widget.child,
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final double offsetY;

  _TrianglePainter({required this.offsetY});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = TColors.dark;

    final path = Path()
      ..moveTo(0, size.height + offsetY)
      ..lineTo(size.width / 2, 0 + offsetY)
      ..lineTo(size.width, size.height + offsetY)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
