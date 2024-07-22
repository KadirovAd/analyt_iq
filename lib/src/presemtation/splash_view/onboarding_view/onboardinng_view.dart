import 'package:flutter/material.dart';
import 'package:history_trade/src/components/buttons/custom_button.dart';
import 'package:history_trade/src/components/container/custom_container_bagraound_color.dart';
import 'package:history_trade/src/presemtation/questionnaire_screen/questionnaire_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  double currentPage = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return CustomContainerBagraoundColor(
      body: Column(
        children: [
          SizedBox(
            height: 86.1.h,
            width: double.infinity,
            child: PageView.builder(
              controller: _controller,
              itemCount: 3,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index.toDouble();
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 65.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/ondoarding${index + 1}.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(95),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 21),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            OnboardingHelpers.title[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21.9.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            OnboardingHelpers.subtitles[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Center(
            child: CustomButton(
              height: 4.1.h,
              width: 40.w,
              onPressed: () {
                if (currentPage == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuestionnaireScreen(),
                    ),
                  );
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              text: Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 1.5.h,
              dotWidth: 2.h,
              activeDotColor: const Color(0xFF1E1E1E),
              dotColor: const Color(0xFFE8E8E8),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingHelpers {
  static final List<String> title = [
    'Welcome to Startup \nFinance Tracker!',
    'Comprehensive Financial Tracking',
    'Compare Your Earnings',
  ];
  static final List<String> subtitles = [
    'Streamline your financial management with our app. Track expenses, manage income, and gain insights to drive your tech startup’s growth.',
    'Easily log and categorize your expenses and income. Get detailed reports to understand your financial health and make informed decisions for your startup.',
    'See how your earnings stack up against other tech startups. Use our comparison tools to set benchmarks, identify growth opportunities, and stay competitive in the tech industry.'
  ];
}
