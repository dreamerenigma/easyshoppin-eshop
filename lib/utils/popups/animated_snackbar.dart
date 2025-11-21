import 'dart:ui';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class AnimatedSnackBar extends StatefulWidget {
  final String message;
  final Widget? icon;
  final Color? iconColor;
  final Color? backgroundColor;

  const AnimatedSnackBar({
    super.key,
    required this.message,
    this.icon,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  AnimatedSnackBarState createState() => AnimatedSnackBarState();
}

class AnimatedSnackBarState extends State<AnimatedSnackBar> with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _opacityController;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _opacityController,
      curve: Curves.easeInOut,
    ));

    _slideController.forward();
    _opacityController.repeat(reverse: true);
  }

  Future<void> hideSnackBar() async {
    await _slideController.reverse();
    _opacityController.stop();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = widget.backgroundColor ?? TColors.red;

    return SlideTransition(
      position: _offsetAnimation,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: bgColor,
            boxShadow: [
              BoxShadow(
                color: TColors.black.withAlpha((0.3 * 255).toInt()),
                offset: Offset(0, 4),
                blurRadius: 15,
                spreadRadius: 0,
              ),
            ],
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Row(
              mainAxisAlignment: widget.icon != null ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  AnimatedBuilder(
                    animation: _opacityAnimation,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _opacityAnimation.value,
                        child: IconTheme(
                          data: IconThemeData(color: widget.iconColor ?? TColors.white),
                          child: widget.icon!,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Text(
                    widget.message,
                    style: TextStyle(
                      color: theme.brightness == Brightness.dark ? TColors.white.withAlpha((0.85 * 255).toInt()) : TColors.black.withAlpha((0.85 * 255).toInt()),
                      fontSize: TSizes.fontSizeMd,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      decoration: TextDecoration.none,
                    ),
                    textAlign: widget.icon != null ? TextAlign.start : TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
