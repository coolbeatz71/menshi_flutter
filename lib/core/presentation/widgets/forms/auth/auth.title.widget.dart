import 'package:flutter/material.dart';

class FormAuthTitle extends StatelessWidget {
  final String text;
  const FormAuthTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
