import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class SignUpModal extends StatefulWidget {
  const SignUpModal({super.key});

  @override
  State<SignUpModal> createState() => _SignUpModalState();
}

class _SignUpModalState extends State<SignUpModal> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 1.5,
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        decoration: const BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Text("Sign Up"),
            ],
          ),
        ),
      ),
    );
  }
}
