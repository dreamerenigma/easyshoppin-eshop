import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:window_manager/window_manager.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_vectors.dart';

class CustomMaximizeRestoreButton extends StatefulWidget {
  final ValueNotifier<bool> isMaximizedNotifier;
  final Color iconColor;
  final Color hoverColor;
  final Color highlightColor;

  const CustomMaximizeRestoreButton({
    super.key,
    required this.isMaximizedNotifier,
    required this.iconColor,
    required this.hoverColor,
    required this.highlightColor,
  });

  @override
  CustomMaximizeRestoreButtonState createState() => CustomMaximizeRestoreButtonState();
}

class CustomMaximizeRestoreButtonState extends State<CustomMaximizeRestoreButton> {
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
    final isHoveredNotifier = ValueNotifier(false);

    return ValueListenableBuilder<bool>(
      valueListenable: widget.isMaximizedNotifier,
      builder: (context, isMaximized, _) {
        return ValueListenableBuilder<bool>(
          valueListenable: isHoveredNotifier,
          builder: (context, isHovered, _) {
            return MouseRegion(
              onEnter: (_) => isHoveredNotifier.value = true,
              onExit: (_) => isHoveredNotifier.value = false,
              child: Material(
                color: TColors.transparent,
                child: InkWell(
                  onTap: () async {
                    final isCurrentlyMaximized = await windowManager.isMaximized();
                    if (isCurrentlyMaximized) {
                      await windowManager.restore();
                    } else {
                      await windowManager.maximize();
                    }
                  },
                  mouseCursor: SystemMouseCursors.basic,
                  splashColor: TColors.transparent,
                  highlightColor: widget.highlightColor,
                  hoverColor: widget.hoverColor,
                  child: isMaximized
                    ? Padding(
                        padding: const EdgeInsets.only(left: 18, right: 18, top: 16, bottom: 14),
                        child: SvgPicture.asset(
                          TVectors.maximize,
                          width: 12,
                          height: 12,
                          colorFilter: ColorFilter.mode(isHovered ? TColors.white : (isWindowActive ? widget.iconColor : TColors.darkGrey), BlendMode.srcIn),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 18, right: 18, top: 16, bottom: 14),
                        child: Icon(
                          FluentIcons.maximize_48_filled,
                          size: 14,
                          color: isHovered ? TColors.white : (isWindowActive ? widget.iconColor : TColors.darkGrey),
                        ),
                      ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
