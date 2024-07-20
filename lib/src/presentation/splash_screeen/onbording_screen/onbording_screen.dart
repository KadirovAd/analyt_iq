import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  double currentPage = 0;
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentPage < 2) {
      _controller.animateToPage(
        currentPage.toInt() + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to another screen if needed
    }
  }

  Widget buildIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 10,
      width: currentPage.round() == index ? 20 : 10,
      decoration: BoxDecoration(
        color: currentPage.round() == index
            ? const Color(0xFF5768E5)
            : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: 3,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index.toDouble();
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      OnboardingHelpers.images[index],
                      height: 40.h,
                      placeholderBuilder: (BuildContext context) =>
                          const CircularProgressIndicator(),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      OnboardingHelpers.blackText[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.32,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      OnboardingHelpers.orangeText[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.32,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: nextPage,
                      child: Container(
                        width: 160,
                        height: 41,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(-1.00, 0.00),
                            end: Alignment(1, 0),
                            colors: [Color(0xFF719EE0), Color(0xFF100744)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(37),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.32,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (idx) => buildIndicator(idx)),
                    ),
                    SizedBox(height: 2.h),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingHelpers {
  static final List<String> blackText = [
    'Welcome to Startup Finance Tracker!',
    'Comprehensive Financial Tracking',
    'Compare Your Earnings',
  ];
  static final List<String> orangeText = [
    'Streamline your financial management with our app. Track expenses, manage income, and gain insights to drive your tech startup’s growth.',
    'Easily log and categorize your expenses and income. Get detailed reports to understand your financial health and make informed decisions for your startup.',
    'See how your earnings stack up against other tech startups. Use our comparison tools to set benchmarks, identify growth opportunities, and stay competitive in the tech industry.',
  ];

  static final List<String> images = [
    'assets/images/profil.png',
    'assets/images/income.png',
    'assets/images/rating.png',
  ];
}
