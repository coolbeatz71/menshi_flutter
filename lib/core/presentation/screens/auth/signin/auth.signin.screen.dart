import 'package:flutter/material.dart';

import '../../../widgets/modals/signin.modal.widget.dart';
import '../../../widgets/onboarding/onboarding.background.widget.dart';

class AuthSignInScreen extends StatefulWidget {
  const AuthSignInScreen({super.key});

  @override
  State<AuthSignInScreen> createState() => _AuthSignInScreenState();
}

class _AuthSignInScreenState extends State<AuthSignInScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await showGeneralDialog<Widget>(
          context: context,
          barrierDismissible: false,
          transitionDuration: const Duration(milliseconds: 400),
          transitionBuilder: (context, animation, secondaryAnimation, child) {
            Tween<Offset> tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
            return SlideTransition(
              position: tween.animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: child,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return const SignInModal();
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
