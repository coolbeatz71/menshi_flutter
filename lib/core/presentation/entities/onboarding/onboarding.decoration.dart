import 'dart:ui';

class BackgroundCircle {
  final double size;
  final Color color;

  const BackgroundCircle({required this.size, required this.color});
}

class DecorationCircle {
  final double size;
  final Color color;
  final Offset position;

  const DecorationCircle({
    required this.size,
    required this.color,
    required this.position,
  });
}
