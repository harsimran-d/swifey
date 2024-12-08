import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:swifey/src/features/authentication/application/auth_notifier.dart';
import 'package:swifey/src/features/authentication/presentation/signin/signin_screen.dart';
import 'package:swifey/src/features/authentication/presentation/signup/signup_screen.dart';
import 'package:swifey/src/features/landing/presentation/landing_screen.dart';
import 'package:swifey/src/features/match/presentation/match_screen.dart';
import 'package:swifey/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:swifey/src/features/profile/presentation/profile_screen.dart';

import 'navigation_shell_screen.dart';

part 'app_routes.dart';

final guestOnlyPaths = ['/signin', '/signup', '/'];
final loginRequiredPaths = ['/match', '/profile'];
final goRouterProvider = Provider<GoRouter>((ref) {
  final goRouterKey = GlobalKey<NavigatorState>();
  final matchShellKey = GlobalKey<NavigatorState>();
  final profileShellKey = GlobalKey<NavigatorState>();

  final authNotifier = ref.watch(authNotifierProvider);
  return GoRouter(
    navigatorKey: goRouterKey,
    debugLogDiagnostics: true,
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final isAuthenticated = authNotifier.isAuthenticated;
      if (!isAuthenticated && loginRequiredPaths.contains(state.uri.path)) {
        return '/';
      } else if (isAuthenticated && guestOnlyPaths.contains(state.uri.path)) {
        return '/match';
      }
      return null;
    },
    initialLocation: '/profile',
    routes: [
      GoRoute(
          path: '/',
          name: AppRoutes.landing.name,
          builder: (context, state) => const LandingScreen(),
          routes: [
            GoRoute(
              path: 'signup',
              name: AppRoutes.signup.name,
              builder: (context, state) => const SignupScreen(),
            ),
            GoRoute(
              path: "signin",
              name: AppRoutes.signin.name,
              builder: (context, state) => const SigninScreen(),
            ),
            GoRoute(
              path: "onboarding",
              name: AppRoutes.onboarding.name,
              builder: (context, state) => const OnboardingScreen(),
            )
          ]),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavigationShellScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: profileShellKey,
            routes: [
              GoRoute(
                path: "/match",
                name: AppRoutes.match.name,
                builder: (context, state) {
                  return const MatchScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: matchShellKey,
            routes: [
              GoRoute(
                path: "/profile",
                name: AppRoutes.profile.name,
                builder: (context, state) => const ProfileScreen(),
              )
            ],
          ),
        ],
      ),
    ],
  );
});
