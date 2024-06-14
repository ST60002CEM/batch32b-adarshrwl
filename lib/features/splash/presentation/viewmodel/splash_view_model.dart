// lib/providers/splash_screen_notifier.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapdwell/features/splash/presentation/navigator/splash_navigator.dart';


final splashNavigatorProvider = Provider((ref) => SplashNavigator());

final splashScreenNotifierProvider = StateNotifierProvider<SplashScreenNotifier, void>((ref) {
  final navigator = ref.read(splashNavigatorProvider);
  return SplashScreenNotifier(navigator);
});

class SplashScreenNotifier extends StateNotifier<void> {
  final SplashNavigator navigator;

  SplashScreenNotifier(this.navigator) : super(null);

  void navigateToLogin(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      navigator.navigateToLogin(context);
    });
  }
}
