import 'package:flutter/material.dart';

/// Enum to define different types of page transitions
enum PageTransitionType {
  slide,
  fade,
  scale,
  rotation,
}

/// A custom page transition widget that supports multiple types of transitions.
class CustomPageTransition extends PageRouteBuilder {
  final Widget page;
  final PageTransitionType transitionType;
  final Duration duration;
  final Curve curve;

  CustomPageTransition({
    required this.page,
    this.transitionType = PageTransitionType.slide,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            switch (transitionType) {
              case PageTransitionType.fade:
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              case PageTransitionType.scale:
                return ScaleTransition(
                  scale: Tween<double>(begin: 0.8, end: 1.0)
                      .animate(CurvedAnimation(parent: animation, curve: curve)),
                  child: child,
                );
              case PageTransitionType.rotation:
                return RotationTransition(
                  turns: Tween<double>(begin: 0.5, end: 1.0)
                      .animate(CurvedAnimation(parent: animation, curve: curve)),
                  child: child,
                );
              case PageTransitionType.slide:
              default:
                return SlideTransition(
                  position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                      .animate(CurvedAnimation(parent: animation, curve: curve)),
                  child: child,
                );
            }
          },
        );
}