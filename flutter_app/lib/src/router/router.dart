import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:swifey/src/features/authentication/presentation/signin/signin_page.dart';
import 'package:swifey/src/features/authentication/presentation/signup/signup_screen.dart';
import 'package:swifey/src/features/home/presentation/home_screen.dart';
import 'package:swifey/src/features/home/presentation/landing_screen.dart';
import 'package:swifey/src/features/match/presentation/match_screen.dart';
import 'package:swifey/src/features/profile/presentation/manage_profile/manage_profile_screen.dart';
import 'package:swifey/src/features/profile/presentation/onboarding_screen.dart';

part 'app_routes.dart';

final _goRouterKey = GlobalKey<NavigatorState>();
final _matchShellKey = GlobalKey<NavigatorState>();
final _profileShellKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _goRouterKey,
    debugLogDiagnostics: true,
    initialLocation: '/',
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
              builder: (context, state) => const SigninPage(),
            ),
            GoRoute(
              path: "onboarding",
              name: AppRoutes.onboarding.name,
              builder: (context, state) => const OnboardingScreen(),
            )
          ]),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _matchShellKey,
            routes: [
              GoRoute(
                path: "/profile",
                builder: (context, state) => const ManageProfileScreen(),
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _profileShellKey,
            routes: [
              GoRoute(
                path: "/match",
                builder: (context, state) {
                  return const MatchScreen();
                },
              ),
            ],
          )
        ],
      ),
    ],
  );
});
