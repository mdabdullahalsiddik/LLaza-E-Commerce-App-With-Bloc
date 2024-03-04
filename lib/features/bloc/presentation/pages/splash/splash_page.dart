import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/features/bloc/presentation/pages/splash/splash_cubit.dart';
import 'package:laza/router/routes_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        body: BlocListener<SplashCubit , SplashState>(
          listener: (context, state) {
            if (state is EndSplash) {
              context.goNamed(Routes.WELCOME);
            }
          },
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/Logo.svg",
              height: 36.h,
              width: 59.w,
            ),
          ),
        ));
  }
}
