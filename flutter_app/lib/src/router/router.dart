import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:swifey/src/features/authentication/data/auth_repo.dart';
import 'package:swifey/src/features/authentication/presentation/signin/signin_screen.dart';
import 'package:swifey/src/features/authentication/presentation/signup/signup_screen.dart';
import 'package:swifey/src/features/landing/presentation/landing_screen.dart';
import 'package:swifey/src/features/match/presentation/match_screen.dart';
import 'package:swifey/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:swifey/src/features/profile/presentation/profile_screen.dart';
import 'package:swifey/src/router/navigation_shell_screen.dart';

part 'app_routes.dart';

final _goRouterKey = GlobalKey<NavigatorState>();
final matchShellKey = GlobalKey<NavigatorState>();
final profileShellKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((Ref ref) {
  return GoRouter(
      navigatorKey: _goRouterKey,
      debugLogDiagnostics: true,
      redirect: (context, state) {
        final user = ref.watch(authRepoProvider);
        final isAuthenticated = user != null;
        final guestOnlyPaths = ['/signin', '/signup', '/'];
        final loginRequiredPaths = ['/match', '/profile'];
        if (!isAuthenticated && loginRequiredPaths.contains(state.uri.path)) {
          return '/';
        } else if (isAuthenticated && guestOnlyPaths.contains(state.uri.path)) {
          return '/profile';
        }
        return null;
      },
      initialLocation: '/match',
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
                pageBuilder: (context, state) => MaterialPage<void>(
                  fullscreenDialog: true,
                  child: OnboardingScreen(),
                ),
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
      ]);
});
