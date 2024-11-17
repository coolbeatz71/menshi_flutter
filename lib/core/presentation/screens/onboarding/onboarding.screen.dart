import 'package:flutter/material.dart';

import '../../widgets/onboarding/onboarding.background.widget.dart';
import '../../widgets/onboarding/onboarding.container.widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        OnboardingBackground(),
        OnboardingContainer(),
      ],
    );
  }
}
