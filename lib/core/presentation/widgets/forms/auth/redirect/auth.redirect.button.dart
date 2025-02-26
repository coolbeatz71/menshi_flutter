import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/colors.dart';

enum AuthRedirectContext {
  HAVE_ACCOUNT,
  DONT_HAVE_ACCOUNT,
  HAVE_RECEIVE_CODE,
  BACK_TO_SIGNIN,
  FORGOT_PASSWORD,
}

class AuthRedirectButton extends StatelessWidget {
  final bool isCentered;
  final VoidCallback onPressed;
  final AuthRedirectContext authContext;

  const AuthRedirectButton({
    super.key,
    required this.authContext,
    required this.onPressed,
    this.isCentered = true,
  });

  @override
  Widget build(BuildContext context) {
    String mainText;
    String? linkText;

    switch (authContext) {
      case AuthRedirectContext.HAVE_ACCOUNT:
        mainText = "Already have an account? ";
        linkText = "Sign In";
        break;
      case AuthRedirectContext.DONT_HAVE_ACCOUNT:
        mainText = "Don't have an account? ";
        linkText = "Sign Up";
        break;
      case AuthRedirectContext.HAVE_RECEIVE_CODE:
        mainText = "Haven't received any code? ";
        linkText = "Resend";
        break;
      case AuthRedirectContext.BACK_TO_SIGNIN:
        mainText = "Want to go back? ";
        linkText = "Sign In";
        break;
      case AuthRedirectContext.FORGOT_PASSWORD:
        mainText = "Forgot your password?";
        linkText = null;
        break;
    }

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Text(
            mainText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          linkText != null
              ? Text(
                  linkText,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary,
                      ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
