import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hr_project/auth_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("lib/images/animation_lm2sgdgp.json"),
          ],
        ),
      ),
      nextScreen: const AuthPage(),
      duration: 2000,
      // splashTransition: SplashTransition.sizeTransition,
      splashIconSize: 400,
      centered: true,
      backgroundColor: Colors.white,
      disableNavigation: false,
      animationDuration: const Duration(milliseconds: 2000),
    );
  }
}
