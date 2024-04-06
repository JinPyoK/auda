import 'package:auda/presentation/NavigationLayout/view/navigation_layout.dart';
import 'package:auda/presentation/auth/view/login_screen.dart';
import 'package:auda/presentation/following/view/following_screen.dart';
import 'package:auda/presentation/home/view/home_screen.dart';
import 'package:auda/presentation/my/view/my_screen.dart';
import 'package:auda/presentation/splash/view/splash_screen.dart';
import 'package:go_router/go_router.dart';

sealed class CustomRouter {
  // BottomNav Key
  static StatefulNavigationShell? shell;

  // Router name
  static const splashScreen = 'splashScreen';
  static const loginScreen = 'loginScreen';
  static const homeScreen = 'homeScreen';
  static const followingScreen = 'followingScreen';
  static const myScreen = 'myScreen';

  // Router
  static final router = GoRouter(
    initialLocation: '/',
    routes: _routes,
  );
}

final _routes = [
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
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      CustomRouter.shell = navigationShell;
      return NavigationLayout();
    },
    branches: <StatefulShellBranch>[
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: "/home",
            name: CustomRouter.homeScreen,
            builder: (context, state) => const HomeScreen(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: "/following",
            name: CustomRouter.followingScreen,
            builder: (context, state) => const FollowingScreen(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: "/my",
            name: CustomRouter.myScreen,
            builder: (context, state) => const MyScreen(),
          ),
        ],
      ),
    ],
  ),
];
