import 'package:flutter/material.dart';
import '../features/shop/screens/home/widgets/windows_app_shell.dart';

PageRouteBuilder<T> createPageRoute<T>(Widget page) {
  return PageRouteBuilder<T>(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween<Offset>(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween.chain(CurveTween(curve: curve)));

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 400),
  );
}

PageRouteBuilder<T> createPageRouteNoAnimation<T>(Widget page, {bool showAppBar = true}) {
  return PageRouteBuilder<T>(
    pageBuilder: (context, animation, secondaryAnimation) => WindowsAppShell(showAppBar: showAppBar, child: page),
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
  );
}
