import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MinusScreen extends StatelessWidget {
  const MinusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTab('Year', true),
                  _buildTab('Month', false),
                  _buildTab('Week', false),
                ],
              ),
              SizedBox(height: 2.h),
              SizedBox(
                height: 25.h,
                width: double.infinity,
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 3000),
                          const FlSpot(1, 4500),
                          const FlSpot(2, 2000)
                        ], // Example data
                        isCurved: true,
                        color: Colors.red,
                        barWidth: 2,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Category',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 1.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildChip('All', true),
                    _buildChip('Equipment', false),
                    _buildChip('Software', false),
                    _buildChip('Advertising', false),
                  ],
                ),
              ),
              SizedBox(height: 1.h),
              Expanded(
                child: ListView(
                  children: const [
                    ExpenseCard(
                        icon: Icons.business,
                        amount: -2000,
                        date: '21 July 2024'),
                    ExpenseCard(
                        icon: Icons.money, amount: -1300, date: '18 July 2024'),
                    ExpenseCard(
                        icon: Icons.school,
                        amount: -2000,
                        date: '17 July 2024'),
                    ExpenseCard(
                        icon: Icons.business,
                        amount: -2000,
                        date: '15 July 2024'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        gradient: isSelected
            ? const LinearGradient(
                colors: [Color(0xFF6A93CC), Color(0xFF1E3C72)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isSelected ? null : Colors.blue.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
        backgroundColor:
            isSelected ? Colors.blue.shade900 : Colors.blue.shade300,
      ),
    );
  }
}

class ExpenseCard extends StatelessWidget {
  final IconData icon;
  final int amount;
  final String date;

  const ExpenseCard(
      {super.key,
      required this.icon,
      required this.amount,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(
          '-\$${amount.abs()}',
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
