import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapdwell/features/splash/presentation/viewmodel/splash_view_model.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    ref.read(splashViewModelProvider.notifier).openLoginView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'FundNepal',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Image.asset('assets/images/fund_nepal_logo.png',
                  // put width and height based on screen size
                  width: screenWidth * 0.8 ,
                  height: screenHeight * 0.3,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
          ],
        ),
      ),

    );
  }
}
