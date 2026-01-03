import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mazeh_app/features/add_recipes/presentation/screens/add_recipe_screen.dart';
import 'package:mazeh_app/features/home/presentation/screens/home_screen.dart';
import 'package:mazeh_app/features/navigation/presentation/widgets/bottom_navigation_shell.dart';
import 'package:mazeh_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:mazeh_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:mazeh_app/features/refrigerator/presentation/screens/refrigerator_screen.dart';
import 'package:mazeh_app/features/register/presentation/screens/register_screen.dart';
import 'package:mazeh_app/features/saved_recipes/presentatin/screens/save_recipe_screen.dart';

final appGlobalRout = GoRouter(
  errorBuilder: (context, state) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen not found'), centerTitle: true),
      backgroundColor: Colors.redAccent[200],
      body: SafeArea(child: Center(child: Text('error screen ${state.error}'))),
    );
  },
  debugLogDiagnostics: true,
  initialLocation: '/onboarding',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BottomNavigationShell(
          location: state.uri.toString(),
          child: child,
        );
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
        GoRoute(
          path: '/refrigerator',
          builder: (context, state) => const RefrigeratorScreen(),
        ),
        GoRoute(
          path: '/add',
          builder: (context, state) => const AddRecipeScreen(),
        ),
        GoRoute(
          path: '/save',
          builder: (context, state) => const SaveRecipeScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
