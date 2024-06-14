// lib/views/splash_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapdwell/features/splash/presentation/viewmodel/splash_view_model.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(splashScreenNotifierProvider.notifier).navigateToLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/logo.png', width: 100, height: 100),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
