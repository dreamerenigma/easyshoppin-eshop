import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/app_colors.dart';

class TCircularIcon extends StatefulWidget {
  /// A custom Circular Icon widget that supports both standard icons and SVG icons.
  ///
  /// Properties:
  /// - `width`, `height`, `backgroundColor` - для контейнера.
  /// - `icon`, `size`, `color`, `onPressed` - для обычных иконок.
  /// - `svgAssetPath` - путь к SVG-иконке (если указан, используется вместо стандартной иконки).
  final double? width, height, size;
  final IconData? icon;
  final String? svgAssetPath;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final Color? hoverBackgroundColor;

  const TCircularIcon({
    super.key,
    this.icon,
    this.svgAssetPath,
    this.width,
    this.height,
    this.size = 24,
    this.onPressed,
    this.color,
    this.backgroundColor,
    this.hoverBackgroundColor,
  }) : assert(icon != null || svgAssetPath != null, 'Either icon or svgAssetPath must be provided');

  @override
  State<TCircularIcon> createState() => _TCircularIconState();
}

class _TCircularIconState extends State<TCircularIcon> {
  bool _isHovering = false;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isHovering ? (widget.hoverBackgroundColor ?? TColors.grey.withAlpha((0.1 * 255).toInt())) : TColors.transparent,
          ),
          child: widget.svgAssetPath != null
              ? SvgPicture.asset(
                  widget.svgAssetPath!,
                  width: widget.size,
                  height: widget.size,
                  colorFilter: widget.color != null ? ColorFilter.mode(widget.color!, BlendMode.srcIn) : null,
                )
              : IconButton(
                  onPressed: widget.onPressed,
                  icon: Icon(widget.icon, color: widget.color, size: widget.size),
                ),
        ),
      ),
    );
  }
}
