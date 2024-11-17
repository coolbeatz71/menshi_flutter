import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide Image;

import '../../../utils/colors.dart';

class OnboardingBackground extends StatefulWidget {
  const OnboardingBackground({super.key});

  @override
  State<OnboardingBackground> createState() => _OnboardingBackgroundState();
}

class _OnboardingBackgroundState extends State<OnboardingBackground> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary.withOpacity(0.45),
        child: Stack(
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width * 1.5,
              left: MediaQuery.of(context).size.width * 0.25,
              top: MediaQuery.of(context).size.width * 0.25,
              child: Image.asset(
                "assets/backgrounds/spline.png",
              ),
            ),
            const RiveAnimation.asset(
              "assets/rives/shapes.riv",
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 48, sigmaY: 48),
                child: const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
