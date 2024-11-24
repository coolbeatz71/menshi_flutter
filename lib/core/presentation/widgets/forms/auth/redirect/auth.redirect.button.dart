import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/colors.dart';

enum AuthRedirectContext {
  HAVE_ACCOUNT,
  DONT_HAVE_ACCOUNT,
  HAVE_RECEIVE_CODE,
  BACK_TO_SIGNIN,
}

class AuthRedirectButton extends StatelessWidget {
  final VoidCallback onPressed;
  final AuthRedirectContext authContext;

  const AuthRedirectButton({
    super.key,
    required this.authContext,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    String mainText;
    String linkText;

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
    }

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            mainText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            linkText,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
          ),
        ],
      ),
    );
  }
}
