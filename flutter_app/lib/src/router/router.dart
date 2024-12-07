import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:swifey/src/features/authentication/presentation/signin/signin_page.dart';
import 'package:swifey/src/features/authentication/presentation/signup/signup_screen.dart';
import 'package:swifey/src/features/home/presentation/home_or_landing.dart';
import 'package:swifey/src/features/profile/presentation/create_profile_page.dart';

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
            ),
            GoRoute(
              path: "signin",
              name: AppRoutes.signin.name,
              builder: (context, state) => const SigninPage(),
            ),
            GoRoute(
              path: "profile",
              name: AppRoutes.profile.name,
              builder: (context, state) => const CreateProfilePage(),
            )
          ]),
    ],
  );
});
