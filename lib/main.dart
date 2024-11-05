import 'package:flutter/material.dart';
import 'package:menshy/core/utils/colors.dart';

import 'core/screens/Onboarding.Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menshy',
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
        fontFamily: "Montserrat",
      ),
      home: const OnboardingScreen(),
    );
  }
}
