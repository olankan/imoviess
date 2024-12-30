import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imovies_flutter/src/core/shared/presentation/view/bottomBarRouter/bottomBarRouter.dart';
import 'package:imovies_flutter/src/feature/auth/forgot%20password/pages/forgot_password.dart';
import 'package:imovies_flutter/src/feature/auth/forgot%20password/pages/password_reset.dart';
import 'package:imovies_flutter/src/feature/auth/sign%20in/pages/signin.screen.dart';
import 'package:imovies_flutter/src/feature/auth/sign%20up/pages/signup.screen.dart';
import 'package:imovies_flutter/src/feature/auth/validation/pages/validation.screen.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/pages/description.screen.dart';
import 'package:imovies_flutter/src/feature/youtube%20Player/youtubePlayer.dart';
import 'package:imovies_flutter/src/feature/splash_screen/splash.screen.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => SplashScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: 'description',
          builder: (BuildContext context, GoRouterState state) =>
              const MovieDescription(),
        ),
        GoRoute(
          path: 'passwordReset',
          builder: (BuildContext context, GoRouterState state) =>
                PasswordResetScreen(),
        ),
        GoRoute(
          path: 'forgotPassword',
          builder: (BuildContext context, GoRouterState state) =>
              const ForgotPasswordScreen(),
        ),
        GoRoute(
          path: 'signUp',
          builder: (BuildContext context, GoRouterState state) =>
              const SignupScreen(),
        ),
        GoRoute(
          path: 'validationScreen',
          builder: (BuildContext context, GoRouterState state) =>
              const ValidationScreen(),
        ),
        GoRoute(
          path: 'signIn',
          builder: (BuildContext context, GoRouterState state) =>
              const SigninScreen(),
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) =>
              const BottomNavBarRouter(),
        ),
      ],
    ),
  ],
);
