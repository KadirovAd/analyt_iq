import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:t89/src/presentation/splash_screeen/splash_screen.dart';

void main() {
  runApp(const AnalytiQ());
}

class AnalytiQ extends StatelessWidget {
  const AnalytiQ({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
    });
  }
}
