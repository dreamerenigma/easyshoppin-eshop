import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:window_manager/window_manager.dart';
import '../../../utils/constants/app_colors.dart';

class CustomCloseButton extends StatefulWidget {
  final Color iconColor;
  final Color hoverColor;
  final Color highlightColor;

  const CustomCloseButton({
    super.key,
    required this.iconColor,
    required this.hoverColor,
    required this.highlightColor,
  });

  @override
  CustomCloseButtonState createState() => CustomCloseButtonState();
}

class CustomCloseButtonState extends State<CustomCloseButton> {
  bool isWindowActive = true;

  @override
  void initState() {
    super.initState();
    _checkWindowFocus();
  }

  void _checkWindowFocus() async {
    final isFocused = await windowManager.isFocused();
    setState(() {
      isWindowActive = isFocused;
    });

    Future.delayed(Duration(milliseconds: 100), () {
      _checkWindowFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isHovered = ValueNotifier(false);

    return ValueListenableBuilder<bool>(
      valueListenable: isHovered,
      builder: (_, hovered, _) {
        return MouseRegion(
          onEnter: (_) => isHovered.value = true,
          onExit: (_) => isHovered.value = false,
          child: Material(
            color: TColors.transparent,
            child: InkWell(
              onTap: () => windowManager.close(),
              mouseCursor: SystemMouseCursors.basic,
              splashColor: TColors.transparent,
              highlightColor: widget.highlightColor,
              hoverColor: widget.hoverColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 10),
                child: Icon(
                  Ionicons.close_outline,
                  size: 21,
                  color: hovered ? TColors.white : (isWindowActive ? widget.iconColor : TColors.darkGrey),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}