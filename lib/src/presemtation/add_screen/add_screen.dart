import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:history_trade/src/components/container/custom_container_bagraound_color.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerBagraoundColor(
      body: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Income'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTab('Year'),
                  _buildTab('Month'),
                  _buildTab('Week'),
                ],
              ),
              SizedBox(height: 2.h),
              Container(
                height: 25.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '4500',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'Clients',
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
                    _buildChip('All'),
                    _buildChip('John Mitchell'),
                    _buildChip('Emily Davis'),
                    _buildChip('Michael Thomas'),
                  ],
                ),
              ),
              SizedBox(height: 1.h),
              Expanded(
                child: ListView(
                  children: const [
                    ClientCard(
                        clientName: 'Benjamin Davis',
                        amount: 2000,
                        date: '15 July 2024'),
                    ClientCard(
                        clientName: 'Benjamin Davis',
                        amount: 2000,
                        date: '15 July 2024'),
                    ClientCard(
                        clientName: 'Benjamin Davis',
                        amount: 2000,
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

  Widget _buildTab(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.blue.shade300,
      ),
    );
  }
}

class ClientCard extends StatelessWidget {
  final String clientName;
  final int amount;
  final String date;

  const ClientCard(
      {super.key,
      required this.clientName,
      required this.amount,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(clientName),
        subtitle: Text(
          '+\$${amount.toString()}',
          style: const TextStyle(color: Colors.green),
        ),
        trailing: Text(date),
      ),
    );
  }
}
