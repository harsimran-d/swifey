import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:swifey/src/features/authentication/presentation/signup/signup_screen.dart';
import 'package:swifey/src/features/home/presentation/home_or_landing.dart';

part 'app_routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          name: AppRoutes.home.name,
          builder: (context, state) => const HomeOrLanding(),
          routes: [
            GoRoute(
              path: 'signup',
              name: AppRoutes.signup.name,
              builder: (context, state) => const SignupScreen(),
            )
          ]),
    ],
  );
});
