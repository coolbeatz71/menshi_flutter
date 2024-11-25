import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../extensions/darkmode.extension.dart';
import '../../../../screens/auth/signin/auth.signin.screen.dart';
import '../../../shared/animations/fade.animation.dart';
import '../../../shared/animations/fade.route.transition.dart';
import '../../../shared/buttons/solid.button.dart';
import '../../../shared/logo/logo.widget.dart';
import '../../../shared/richtext/termscondition.widget.dart';
import '../../../shared/textfields/textfield.widget.dart';
import '../auth.title.widget.dart';
import '../redirect/auth.redirect.button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

/// TODO: this signup form should be a multi-step form like the facebook one
class _SignUpFormState extends State<SignUpForm> {
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
        const FormAuthTitle(text: "Register to Join"),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            alignment: WrapAlignment.center,
            children: [
              AppTextField(label: "First Name", filled: true),
              AppTextField(label: "Last Name", filled: true),
              AppTextField(label: "Telephone", filled: true),
              AppTextField(label: "Password", filled: true, isPassword: true),
              // AppTextField(label: "Confirm Password", filled: true, isPassword: true),
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
            text: "Sign Up",
            onPressed: () {
              //
            },
          ),
        ),
        AuthRedirectButton(
          authContext: AuthRedirectContext.HAVE_ACCOUNT,
          onPressed: () {
            Navigator.push(
              context,
              FadeRouteTransition(
                screen: const AuthSignInScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
