import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "",
        children: [
          TextSpan(
            text: "By continuing, you acknowledge that you understand and agree to the ",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                // Navigate to terms & conditions screen
              },
              child: Text(
                "Terms & Conditions",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ),
          ),
          TextSpan(
            text: " and ",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                // Navigate to privacy policy screen
              },
              child: Text(
                "Privacy Policy",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
