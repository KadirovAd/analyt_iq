import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:history_trade/src/components/container/custom_container_bagraound_color.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerBagraoundColor(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 2.h),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        NetworkImage('https://example.com/user-image.jpg'),
                  ),
                  SizedBox(width: 4.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alexander Miller',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Level 2',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.edit,
                            size: 16.sp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              _buildListTile(
                'Notifications',
                trailing: Switch(value: true, onChanged: (bool value) {}),
                color: const Color(0xFF08184A),
              ),
              _buildListTile(
                'Share',
                color: const Color(0xFF08184A),
              ),
              _buildListTile(
                'Rate us',
                color: const Color(0xFF08184A),
              ),
              _buildListTile(
                'Support',
                color: const Color(0xFF08184A),
              ),
              _buildListTile('Delete account',
                  color: const Color(0xFF08184A), textColor: Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(String title,
      {Widget? trailing, Color? textColor, Color? color}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 19),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              color: textColor ?? Colors.white,
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}
