import 'package:flutter/material.dart';

import 'core/utils/Colors.dart';
import 'core/utils/String.dart';
import 'core/constants/App.dart';
import 'core/screens/Onboarding.Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME.toCapitalized(),
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
        fontFamily: "Montserrat",
      ),
      home: const OnboardingScreen(),
    );
  }
}
