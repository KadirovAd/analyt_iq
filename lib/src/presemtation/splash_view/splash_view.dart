import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:history_trade/src/presemtation/splash_view/onboarding_view/onboardinng_view.dart';
import 'package:splash_view/source/source.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashView(
      title: SvgPicture.asset('assets/icons/logo.svg'),
      backgroundColor: Colors.white,
      gradient: const LinearGradient(
        colors: [
          Color(0xFF056FD1), // A lighter shade of blue
          Color(0xFF84B3FA), // A darker shade of blue
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      duration: const Duration(seconds: 3),
      done: Done(
        const OnboardingView(),
      ),
    );
  }
}
