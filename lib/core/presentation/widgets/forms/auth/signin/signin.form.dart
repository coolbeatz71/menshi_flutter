import 'package:flutter/material.dart';
import 'package:menshi/core/extensions/darkmode.extension.dart';

import '../../../../screens/auth/signup/auth.signup.screen.dart';
import '../../../shared/animations/fade.animation.dart';
import '../../../shared/animations/fade.route.transition.dart';
import '../../../shared/buttons/solid.button.dart';
import '../../../shared/logo/logo.widget.dart';
import '../../../shared/richtext/termscondition.widget.dart';
import '../../../shared/textfields/textfield.widget.dart';
import '../auth.title.widget.dart';
import '../redirect/auth.redirect.button.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Logo(
            logoContext: LogoContext.ICON,
            isDarkTheme: context.isDarkMode,
          ),
        ),
        const FormAuthTitle(text: "Login to Continue"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            alignment: WrapAlignment.center,
            children: [
              const AppTextField(label: "Telephone", filled: true),
              const AppTextField(label: "Password", filled: true, isPassword: true),
              AuthRedirectButton(
                isCentered: false,
                authContext: AuthRedirectContext.FORGOT_PASSWORD,
                onPressed: () {
                  // navigate to forgot password screen
                },
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: TermsAndConditions(),
        ),
        FadeAnimation(
          delay: 0.65,
          child: SolidButton(
            size: "sm",
            text: "Sign In",
            onPressed: () {
              //
            },
          ),
        ),
        AuthRedirectButton(
          authContext: AuthRedirectContext.DONT_HAVE_ACCOUNT,
          onPressed: () {
            Navigator.push(
              context,
              FadeRouteTransition(
                screen: const AuthSignUpScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
