import 'package:flutter/material.dart';
import 'package:snapdwell/app/navigator_key/navigator_key.dart';
import 'package:snapdwell/features/auth/presentation/view/login_view.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
      title: 'SnapDwell',
    );
  }
}
