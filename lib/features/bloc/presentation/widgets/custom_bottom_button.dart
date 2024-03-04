import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class CustomBottomButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const CustomBottomButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: SocialLoginButton(
        text: text,
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        buttonType: SocialLoginButtonType.generalLogin,
        onPressed: onPressed
      ),
    );
  }
}
