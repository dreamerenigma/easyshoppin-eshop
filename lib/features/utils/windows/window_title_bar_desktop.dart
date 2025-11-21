import 'dart:developer';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:win32/win32.dart' as win32;
import 'package:window_manager/window_manager.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_images.dart';
import '../../../common/widgets/buttons/custom_close_button.dart';
import '../../../common/widgets/buttons/custom_maximize_restore_button.dart';
import '../../../common/widgets/buttons/custom_minimize_button.dart';

class WindowTitleBar extends StatefulWidget {
  final OverlayEntry overlayEntry;
  final ValueNotifier<String?> currentRouteNotifier;

  const WindowTitleBar({
    super.key,
    required this.overlayEntry,
    required this.currentRouteNotifier,
  });

  @override
  State<WindowTitleBar> createState() => _WindowTitleBarState();
}

class _WindowTitleBarState extends State<WindowTitleBar> with WindowListener {
  late OverlayEntry overlayEntry;
  ValueNotifier<bool> isMaximizedNotifier = ValueNotifier(false);
  bool isOverlayOpen = true;

  @override
  void initState() {
    super.initState();
    overlayEntry = widget.overlayEntry;
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      windowManager.ensureInitialized();
      updateMaximizedState();
      windowManager.addListener(this);
    }
  }

  @override
  void dispose() {
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      windowManager.removeListener(this);
    }
    super.dispose();
  }

  @override
  void onWindowMaximize() {
    isMaximizedNotifier.value = true;
  }

  @override
  void onWindowUnmaximize() {
    isMaximizedNotifier.value = false;
  }

  void toggleWindow() async {
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      final isMaximized = await windowManager.isMaximized();
      isMaximized ? await windowManager.restore() : await windowManager.maximize();
    }
  }

  void windowListener() => updateMaximizedState();

  void closeSettingsDialog() {
    if (overlayEntry.mounted) {
      overlayEntry.remove();
      isOverlayOpen = false;
    }
  }

  void updateMaximizedState() async {
    final isMaximized = await windowManager.isMaximized();
    isMaximizedNotifier.value = isMaximized;
  }

  void showSystemMenu(BuildContext context, Offset position) {
    final hwnd = win32.GetForegroundWindow();
    if (hwnd == 0) {
      log("HWND is null");
      return;
    }

    win32.SetForegroundWindow(hwnd);

    final hMenu = win32.GetSystemMenu(hwnd, win32.FALSE);
    if (hMenu == 0) {
      log("System menu is null");
      return;
    }

    final point = calloc<win32.POINT>();
    win32.GetCursorPos(point);

    Future.delayed(Duration(milliseconds: 50), ()
    {
      final result = win32.TrackPopupMenu(
        hMenu,
        win32.TPM_LEFTALIGN | win32.TPM_TOPALIGN | win32.TPM_RETURNCMD | win32.TPM_RIGHTBUTTON | win32.TPM_NOANIMATION,
        point.ref.x,
        point.ref.y,
        0,
        hwnd,
        nullptr,
      );

      calloc.free(point);

      log("TrackPopupMenu result: $result");

      if (result != 0) {
        win32.PostMessage(hwnd, win32.WM_SYSCOMMAND, result, 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      color: (Platform.isWindows || Platform.isMacOS || Platform.isLinux)
        ? (context.isDarkMode ? TColors.dark : TColors.grey.withAlpha((0.7 * 255).toInt()))
        : TColors.transparent,
      child: (Platform.isWindows || Platform.isMacOS || Platform.isLinux)
          ? WindowTitleBarBox(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 4, bottom: 2),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onPanUpdate: (_) => appWindow.startDragging(),
                  onDoubleTap: toggleWindow,
                  onSecondaryTapDown: (details) {
                    final renderBox = context.findRenderObject() as RenderBox;
                    final offset = renderBox.localToGlobal(details.localPosition);
                    showSystemMenu(context, offset);
                  },
                  child: Row(
                    children: [
                      Image.asset(TImages.appLogoLight, width: 21, height: 21),
                      const SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          S.of(context).appName,
                          style: TextStyle(
                            color: context.isDarkMode ? TColors.white : TColors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: MoveWindow()),
              WindowButtons(isMaximizedNotifier: isMaximizedNotifier),
            ],
          ),
        ),
      )
          : Container(),
    );
  }
}

class WindowButtons extends StatelessWidget {
  final ValueNotifier<bool> isMaximizedNotifier;
  const WindowButtons({super.key, required this.isMaximizedNotifier});

  @override
  Widget build(BuildContext context) {
    final buttonColors = WindowButtonColors(
      iconNormal: context.isDarkMode ? TColors.white : TColors.black,
      mouseOver: TColors.darkerGrey.withAlpha((0.3 * 255).toInt()),
      mouseDown: TColors.darkerGrey.withAlpha((0.6 * 255).toInt()),
    );

    final closeButtonColors = WindowButtonColors(
      iconNormal: context.isDarkMode ? TColors.white : TColors.black,
      mouseOver: context.isDarkMode ? TColors.red : TColors.ascentRed,
      mouseDown: TColors.ascentRed,
    );

    return Row(
      children: [
        CustomMinimizeButton(iconColor: buttonColors.iconNormal, hoverColor: buttonColors.mouseOver, highlightColor: buttonColors.mouseDown),
        CustomMaximizeRestoreButton(isMaximizedNotifier: isMaximizedNotifier, iconColor: buttonColors.iconNormal, hoverColor: buttonColors.mouseOver, highlightColor: buttonColors.mouseDown),
        CustomCloseButton(iconColor: closeButtonColors.iconNormal, hoverColor: closeButtonColors.mouseOver, highlightColor: closeButtonColors.mouseDown),
      ],
    );
  }
}
