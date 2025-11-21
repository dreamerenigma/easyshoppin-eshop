import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:easyshoppin_eshop/features/shop/screens/home/widgets/home_appbar_windows.dart';

class WindowsAppShell extends StatelessWidget {
  final Widget child;
  final bool showAppBar;

  const WindowsAppShell({super.key, required this.child, this.showAppBar = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: child),
          if (defaultTargetPlatform == TargetPlatform.windows && showAppBar)
            const Positioned(top: 0, left: 0, right: 0, child: THomeAppBarWindows()),
        ],
      ),
    );
  }
}

