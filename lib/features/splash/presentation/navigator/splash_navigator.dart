// lib/navigation/splash_navigator.dart

import 'dart:async';
import 'package:flutter/material.dart';

class SplashNavigator {
  void navigateToLogin(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }
}
