import 'package:flutter/material.dart';

class RotationTransitionPage extends PageRouteBuilder {
  final Widget page;

  RotationTransitionPage({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return RotationTransition(
              turns: animation,
              child: child,
            );
          },
        );
}