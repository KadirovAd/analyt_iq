import 'package:flutter/material.dart';
import 'package:history_trade/src/components/widgets/buttons/custom_button.dart';
import 'package:history_trade/src/components/container/custom_container_bagraound_color.dart';
import 'package:history_trade/src/components/widgets/custom_circular_progress_indicator/custom_circular_progress_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileFormationScreen extends StatefulWidget {
  const ProfileFormationScreen({super.key});

  @override
  _ProfileFormationScreenState createState() => _ProfileFormationScreenState();
}

class _ProfileFormationScreenState extends State<ProfileFormationScreen> {
  bool _isComplete = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isComplete = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainerBagraoundColor(
        body: SafeArea(
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _isComplete
                  ? _buildSuccessScreen(context)
                  : _buildLoadingScreen(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Profile Formation in Progress',
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
        const SizedBox(height: 20),
        const CustomCircularProgressIndicator(
          size: 60,
          duration: Duration(seconds: 5),
        ),
      ],
    );
  }

  Widget _buildSuccessScreen(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.check_circle_outline, size: 100, color: Colors.white),
        const SizedBox(height: 20),
        CustomButton(
          height: 4.1.h,
          width: 40.w,
          onPressed: () {},
          text: const Center(
            child: Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.32,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
