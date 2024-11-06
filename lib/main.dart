import 'package:flutter/material.dart';

import 'core/utils/colors.dart';
import 'core/utils/string.dart';
import 'core/constants/app.dart';
import 'core/presentation/screens/onboarding/onboarding.screen.dart';

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
