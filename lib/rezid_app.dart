import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'splash_screen.dart';
import 'login_page.dart';
import 'home_page.dart';

void main() {
  runApp(const RezidApp());
}

class RezidApp extends StatelessWidget {
  const RezidApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: Platform.isLinux ? '/home' : '/',  // langsung ke home di Linux
      routes: [
        GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
        GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
        GoRoute(path: '/home', builder: (context, state) => const HomePage()),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF101010),
      ),
    );
  }
}