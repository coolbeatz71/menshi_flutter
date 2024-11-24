import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../animations/border.animation.dart';
import '../buttons/visible.icon.button.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final Widget? suffix;
  final bool filled;
  final Color? filledColor;
  final bool isPassword;

  const AppTextField({
    super.key,
    required this.label,
    this.suffix,
    this.filled = false,
    this.filledColor = Colors.white,
    this.isPassword = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> alpha;
  final FocusNode focusNode = FocusNode();
  late bool _isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = !widget.isPassword;

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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
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
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            child: TextField(
              focusNode: focusNode,
              autocorrect: !widget.isPassword,
              enableSuggestions: !widget.isPassword,
              obscureText: widget.isPassword && !_isPasswordVisible,
              decoration: InputDecoration(
                label: Text(widget.label),
                border: InputBorder.none,
                filled: widget.filled,
                fillColor: widget.filled ? widget.filledColor : null,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                suffixIcon: widget.isPassword
                    ? VisibleIconButton(
                        isPasswordVisible: _isPasswordVisible,
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      )
                    : widget.suffix,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
