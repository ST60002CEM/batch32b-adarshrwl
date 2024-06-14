import 'package:flutter/material.dart';
import 'package:snapdwell/app/navigator_key/navigator_key.dart';
import 'package:snapdwell/screen/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      title: 'SnapDwell',
    );
  }
}
