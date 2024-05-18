import 'package:flutter/material.dart';
import 'package:snapdwell/screen/login_screen.dart';
import 'package:snapdwell/screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}



