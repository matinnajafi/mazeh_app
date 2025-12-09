import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mazeh_app/presentation/screens/add_recipe_screen.dart';
import 'package:mazeh_app/presentation/screens/home_screen.dart';
import 'package:mazeh_app/presentation/screens/profile_screen.dart';
import 'package:mazeh_app/presentation/screens/refrigerator_screen.dart';
import 'package:mazeh_app/presentation/screens/save_recipe_screen.dart';
import 'package:mazeh_app/presentation/widgets/bottom_navigation_shell.dart';

final appGlobalRout = GoRouter(
  errorBuilder: (context, state) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen not found'), centerTitle: true),
      backgroundColor: Colors.redAccent[200],
      body: SafeArea(child: Center(child: Text('error screen ${state.error}'))),
    );
  },
  debugLogDiagnostics: true,
  initialLocation: '/home',
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
  ],
);
