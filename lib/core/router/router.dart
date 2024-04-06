import 'package:auda/presentation/auth/view/login_screen.dart';
import 'package:auda/presentation/splash/view/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

sealed class CustomRouter {
  // Router Key
  static final routerKey = GlobalKey<NavigatorState>();

  // Router name
  static const splashScreen = 'splashScreen';
  static const loginScreen = 'loginScreen';

  // Router
  static final router = GoRouter(
    initialLocation: '/login',
    routes: _routes,
  );
}

final _routes = <GoRoute>[
  GoRoute(
    path: '/',
    name: CustomRouter.splashScreen,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/login',
    name: CustomRouter.loginScreen,
    builder: (context, state) => const LoginScreen(),
  ),
];
