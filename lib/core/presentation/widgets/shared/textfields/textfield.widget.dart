import 'package:flutter/material.dart';
import 'package:menshi/core/utils/colors.dart';

import '../animations/border.animation.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final Widget? suffix;

  const AppTextField({
    super.key,
    required this.label,
    required this.suffix,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> alpha;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    final Animation<double> curve = CurvedAnimation(
      parent: controller!,
      curve: Curves.easeInOut,
    );
    alpha = Tween(begin: 0.0, end: 1.0).animate(curve);

    controller?.addListener(() {
      setState(() {});
    });

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        controller?.forward();
      } else {
        controller?.reverse();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Theme(
        data: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: AppColors.primary,
              ),
        ),
        child: CustomPaint(
          painter: AnimateBorder(alpha.value),
          child: TextField(
            focusNode: focusNode,
            decoration: InputDecoration(
              label: Text(widget.label),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              suffixIcon: widget.suffix,
            ),
          ),
        ),
      ),
    );
  }
}
