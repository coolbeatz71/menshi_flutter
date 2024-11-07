import 'package:flutter/material.dart';

import '../../entities/onboarding/onboarding.decoration.dart';

/// A widget that displays an onboarding decoration
/// with centered background circles and surrounded randomly position decorative circles.
///
/// The widget is essentially displayed behind the onboarding image.
class DecorationOnboarding extends StatelessWidget {
  final BackgroundCircle externalBackgroundCircle;
  final BackgroundCircle internalBackgroundCircle;
  final List<DecorationCircle> decorativeCircles;

  /// Creates a [DecorationOnboarding] widget.
  ///
  /// The [externalBackgroundCircle] and [internalBackgroundCircle] are the center circles.
  /// The [decorativeCircles] are additional decorative circles and dots.
  const DecorationOnboarding({
    super.key,

    // center circles
    this.externalBackgroundCircle =
        const BackgroundCircle(size: 400.0, color: Color(0x70E0BBE4)),
    this.internalBackgroundCircle =
        const BackgroundCircle(size: 300.0, color: Color(0x70D291BC)),

    // additional decorative circles and dots
    this.decorativeCircles = const [
      DecorationCircle(
        size: 50.0,
        color: Color(0x806A1B9A),
        position: Offset(0, 0),
      ),
      DecorationCircle(
        size: 10.0,
        color: Color(0x706A1B9A),
        position: Offset(60, 50),
      ),
      DecorationCircle(
        size: 20.0,
        color: Color(0x70E57373),
        position: Offset(-20, -20),
      ),
    ],
  });

  // Builds the widget tree for the [DecorationOnboarding] widget.
  ///
  /// This method creates a [Stack] widget with the external and internal background circles
  /// at the center and additional decorative circles positioned around them.
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // external center background circle
        ClipOval(
          child: Container(
            width: externalBackgroundCircle.size,
            height: externalBackgroundCircle.size,
            color: externalBackgroundCircle.color,
          ),
        ),

        // internal center background circle
        ClipOval(
          child: Container(
            width: internalBackgroundCircle.size,
            height: internalBackgroundCircle.size,
            color: internalBackgroundCircle.color,
          ),
        ),

        // decorative circles and dots
        ...decorativeCircles.map(
          (circle) => Positioned(
            top: circle.position.dy >= 0 ? circle.position.dy : null,
            bottom: circle.position.dy < 0 ? -circle.position.dy : null,
            left: circle.position.dx >= 0 ? circle.position.dx : null,
            right: circle.position.dx < 0 ? -circle.position.dx : null,
            child: ClipOval(
              child: Container(
                width: circle.size,
                height: circle.size,
                color: circle.color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
