import 'package:flutter/material.dart';

class ScaleTransitionPage extends PageRouteBuilder {
  final Widget page;

  ScaleTransitionPage({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        );
}