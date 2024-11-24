import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/border_draw.dart';

class AnimateBorder extends CustomPainter {
  final double animationPercent;
  AnimateBorder(this.animationPercent);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    paint.strokeWidth = 4;
    paint.color = AppColors.primary;
    paint.style = PaintingStyle.stroke;

    Path pathOne = Path();
    pathOne.moveTo(0, size.height / 2);

    pathOne.lineTo(0, 8);
    pathOne.quadraticBezierTo(0, 0, 8, 0);
    pathOne.lineTo(size.width - 8, 0);
    pathOne.quadraticBezierTo(size.width, 0, size.width, 8);
    pathOne.lineTo(size.width, size.height / 2);

    Path pathTwo = Path();
    pathTwo.moveTo(0, size.height / 2);

    pathTwo.lineTo(0, size.height - 8);
    pathTwo.quadraticBezierTo(0, size.height, 8, size.height);
    pathTwo.lineTo(size.width - 8, size.height);
    pathTwo.quadraticBezierTo(size.width, size.height, size.width, size.height - 8);
    pathTwo.lineTo(size.width, size.height / 2);

    final animatedPathOne = BorderDraw.createAnimatedPath(pathOne, animationPercent);
    final animatedPathTwo = BorderDraw.createAnimatedPath(pathTwo, animationPercent);

    canvas.drawPath(animatedPathOne, paint);
    canvas.drawPath(animatedPathTwo, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
