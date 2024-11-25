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
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              padding: const EdgeInsets.all(24.0),
              margin: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight.withOpacity(0.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(24.0),
                ),
              ),
              child: const Center(
                child: SignInForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
