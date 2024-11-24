import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

/// TODO: need to improve this button: make it more reusable
/// TODO: better I can create style framework for my project and an in house package
class SolidButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? background;
  final Color? textColor;
  final String text;
  final String size;
  final bool full;

  const SolidButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white,
    this.background = AppColors.primary,
    this.size = 'md',
    this.full = false,
  });

  double _getHeight() {
    switch (size) {
      case 'xs':
        return 40.0;
      case 'sm':
        return 50.0;
      case 'md':
        return 60.0;
      case 'lg':
        return 70.0;
      default:
        return 60.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 12.0,
      ),
      onPressed: onPressed,
      child: Container(
        height: _getHeight(),
        alignment: Alignment.center,
        width: full ? double.infinity : null,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
