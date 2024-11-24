import 'package:flutter/material.dart';

class VisibleIconButton extends StatelessWidget {
  final bool isPasswordVisible;
  final VoidCallback onPressed;

  const VisibleIconButton({
    super.key,
    required this.isPasswordVisible,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2.0),
      child: IconButton(
        icon: Icon(
          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
