import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:history_trade/src/components/container/custom_container_bagraound_color.dart';

class StarScreen extends StatefulWidget {
  const StarScreen({super.key});

  @override
  State<StarScreen> createState() => _StarScreenState();
}

class _StarScreenState extends State<StarScreen> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return CustomContainerBagraoundColor(
      body: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('User Rating'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 2.h),
              Container(
                width: 353,
                height: 42,
                padding: const EdgeInsets.all(2),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0x3D767680),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(37),
                  ),
                ),
                child: Row(
                  children: [
                    _buildTab(0, 'Profit'),
                    _buildTab(1, 'Income'),
                    _buildTab(2, 'Expenses'),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade100,
                          ),
                          child: CircularProgressIndicator(
                            value: 0.7,
                            strokeWidth: 10,
                            backgroundColor: Colors.blue.shade300,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.blue.shade900),
                          ),
                        ),
                        CircleAvatar(
                          radius: 30.w,
                          backgroundImage: const NetworkImage(
                              'https://example.com/user-image.jpg'),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Level 2',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Congratulations!',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'You are in the top 10% of users in this year.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(int index, String text) {
    bool isSelected = tab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            tab = index;
          });
        },
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    begin: Alignment(-1.00, 0.00),
                    end: Alignment(1, 0),
                    colors: [Color(0xFF719EE0), Color(0xFF100744)],
                  )
                : null,
            color: isSelected ? null : Colors.transparent,
            borderRadius: isSelected ? BorderRadius.circular(32) : null,
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    isSelected ? Colors.white : Colors.white.withOpacity(0.6),
                fontSize: 14,
                fontFamily: 'Solway',
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
