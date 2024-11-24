import 'package:flutter/material.dart';

import '../../../widgets/modals/signup.modal.widget.dart';
import '../../../widgets/onboarding/onboarding.background.widget.dart';

class AuthSignUpScreen extends StatefulWidget {
  const AuthSignUpScreen({super.key});

  @override
  State<AuthSignUpScreen> createState() => _AuthSignUpScreenState();
}

class _AuthSignUpScreenState extends State<AuthSignUpScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await showGeneralDialog<Widget>(
          context: context,
          barrierDismissible: false,
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return const SignUpModal();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const OnboardingBackground();
  }
}
