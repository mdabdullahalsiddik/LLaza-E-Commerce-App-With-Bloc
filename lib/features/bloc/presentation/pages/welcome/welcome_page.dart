import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/features/bloc/presentation/widgets/custom_bottom_button.dart';
import 'package:laza/router/routes_page.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Let’s Get Started",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.facebook,
                    onPressed: () {},
                  ),
                  const Gap(16),
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.twitter,
                    onPressed: () {},
                  ),
                  const Gap(16),
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.google,
                    onPressed: () {},
                  ),
                  const Gap(16),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  InkWell(
                    onTap: () => context.pushNamed(Routes.SINGIN),
                    child: Text(
                      " Signin",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomButton(
        onPressed: () => context.pushNamed(Routes.SINGUP),
        text: "Create an Account",
      ),
    );
  }
}