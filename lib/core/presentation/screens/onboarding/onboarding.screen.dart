import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide Image;

import '../../../utils/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgrounds/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: AppColors.primary.withOpacity(0.75),
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
      ),
    );
  }
}
