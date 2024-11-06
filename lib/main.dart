import 'package:flutter/material.dart';
import 'package:menshi/core/utils/colors.dart';

import 'core/constants/app.dart';
import 'core/screens/Onboarding.Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
        fontFamily: "Montserrat",
      ),
      home: const OnboardingScreen(),
    );
  }
}
