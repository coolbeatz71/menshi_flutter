import 'package:flutter/material.dart';

class FadeRouteTransition extends PageRouteBuilder {
  final Widget screen;

  FadeRouteTransition({required this.screen})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => screen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
