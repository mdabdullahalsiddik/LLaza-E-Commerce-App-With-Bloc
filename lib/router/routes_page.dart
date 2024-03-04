import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/features/bloc/presentation/pages/home/index.dart';
import 'package:laza/features/bloc/presentation/pages/splash/splash_page.dart';

part "routes.dart";

class RoutesPage {
  static final ROUTER = GoRouter(
    routes: [
      GoRoute(
        path: Routes.SPLASH,
        name: Routes.SPLASH,
        pageBuilder: (context, state) => const MaterialPage(
          child: SplashPage(),
        ),
      ),
      GoRoute(
        path: Routes.HOME,
        name: Routes.HOME,
        pageBuilder: (context, state) => const MaterialPage(
          child: HomePage(),
        ),
      ),
    ],
  );
}
