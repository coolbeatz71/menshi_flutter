import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../forms/auth/signin/signin.form.dart';

class SignInModal extends StatefulWidget {
  const SignInModal({super.key});

  @override
  State<SignInModal> createState() => _SignInModalState();
}

class _SignInModalState extends State<SignInModal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            padding: const EdgeInsets.all(24.0),
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: AppColors.backgroundLight.withOpacity(0.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(24.0),
              ),
            ),
            child: const SignInForm(),
          ),
        ),
      ),
    );
  }
}
