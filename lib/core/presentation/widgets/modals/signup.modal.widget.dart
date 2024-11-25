import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../forms/auth/signup/signup.form.dart';

class SignUpModal extends StatefulWidget {
  const SignUpModal({super.key});

  @override
  State<SignUpModal> createState() => _SignUpModalState();
}

class _SignUpModalState extends State<SignUpModal> {
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
              height: MediaQuery.of(context).size.height * 0.9,
              padding: const EdgeInsets.all(24.0),
              margin: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight.withOpacity(0.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(24.0),
                ),
              ),
              child: const Center(
                child: SignUpForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
