import 'package:flutter/material.dart';
import 'package:history_trade/src/models/user/user_model.dart';
import 'package:provider/provider.dart';
import 'package:history_trade/src/components/buttons/custom_button.dart';
import 'package:history_trade/src/components/container/custom_container_bagraound_color.dart';
import 'package:history_trade/src/presemtation/adding_data/addingIncome_screen/addingIncome_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectCurrencyScreen extends StatefulWidget {
  const SelectCurrencyScreen({super.key});

  @override
  State<SelectCurrencyScreen> createState() => _SelectCurrencyScreenState();
}

class _SelectCurrencyScreenState extends State<SelectCurrencyScreen> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CreateUserModel>(context);
    final selectedCurrency = model.selectedCurrency ?? 'USD';

    final List<String> currencies = [
      'USD',
      'CAD',
      'EUR',
      'RUB',
      'GBP',
      'JPY',
      'ILS',
      'CNY'
    ];

    return CustomContainerBagraoundColor(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 55),
                  const Text(
                    'Select currency',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 35.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 3.7,
                ),
                itemCount: currencies.length,
                itemBuilder: (context, index) {
                  final currency = currencies[index];
                  final isSelected = currency == selectedCurrency;
                  return GestureDetector(
                    onTap: () {
                      model.selectCurrency(currency);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF100A60)
                            : Colors.blue[100],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        currency,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: CustomButton(
                height: 4.1.h,
                width: 40.w,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddingIncomeScreen(),
                      ));
                },
                text: const Center(
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
          ],
        ),
      ),
    );
  }
}
