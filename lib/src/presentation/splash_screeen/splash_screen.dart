import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';
import 'package:t89/src/presentation/splash_screeen/onbording_screen/onbording_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashView(
      title: Column(
        children: [
          SvgPicture.asset(
            'assets/icons/splash_icon.svg',
            placeholderBuilder: (BuildContext context) =>
                const CircularProgressIndicator(),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      duration: const Duration(seconds: 2),
      done: Done(
        const OnboardingView(),
      ),
    );
  }
}
