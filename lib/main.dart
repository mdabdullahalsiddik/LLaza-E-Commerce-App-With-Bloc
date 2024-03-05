import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/features/bloc/domain/repositories/auth_repositories.dart';
import 'package:laza/features/bloc/laza_bloc_observer.dart';

import 'package:laza/features/bloc/presentation/pages/splash/splash_cubit.dart';
import 'package:laza/features/bloc/presentation/pages/welcome/welcome_bloc.dart';
import 'package:laza/firebase_options.dart';

import 'package:laza/router/routes_page.dart';
import 'package:laza/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = LazaBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepositories(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SplashCubit()..stateSplash(),
          ),
          BlocProvider(
            create: (context) => WelcomeBloc(context.read<AuthRepositories>()),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "Laza",
            theme: const MaterialTheme(TextTheme()).light(),
            darkTheme: const MaterialTheme(TextTheme()).dark(),
            routerConfig: RoutesPage.ROUTER,
          ),
        ),
      ),
    );
  }
}
