import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final bool reverse;

  const FadeAnimation({
    super.key,
    this.delay = 0.25,
    required this.child,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        'opacity',
        Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
      )
      ..tween(
        'translateY',
        Tween(begin: reverse ? 30.0 : -30.0, end: 0.0),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      tween: tween,
      duration: tween.duration,
      child: child,
      builder: (context, value, child) => Opacity(
        opacity: value.get('opacity'),
        child: Transform.translate(
          offset: Offset(0, value.get('translateY')),
          child: child,
        ),
      ),
    );
  }
}
