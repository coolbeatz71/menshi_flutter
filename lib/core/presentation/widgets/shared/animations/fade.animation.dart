import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
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
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _translateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    final curve = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curve);
    _translateAnimation =
        Tween<double>(begin: widget.reverse ? 30.0 : -30.0, end: 0.0)
            .animate(curve);

    Future.delayed(Duration(milliseconds: (500 * widget.delay).round()), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.translate(
            offset: Offset(0, _translateAnimation.value),
            child: widget.child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
