import 'package:flutter/material.dart';
import 'package:history_trade/src/models/user/user_model.dart';
import 'package:provider/provider.dart';
import 'package:history_trade/src/components/buttons/custom_button.dart';
import 'package:history_trade/src/components/container/custom_container_bagraound_color.dart';
import 'package:history_trade/src/components/textfild/textfild_ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddExpensesScreens extends StatelessWidget {
  const AddExpensesScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController amountController = TextEditingController();
    final TextEditingController transactionDateController =
        TextEditingController();
    String? selectedCategory;
    List<Map<String, dynamic>> categories = [
      {
        'name': 'Equipment',
        'icon': 'assets/icons/category1.png',
      },
      {
        'name': 'Software',
        'icon': 'assets/icons/category2.png',
      },
      {
        'name': 'Advertising and marketing',
        'icon': 'assets/icons/category3.png'
      },
      {
        'name': 'Education and courses',
        'icon': 'assets/icons/category4.png',
      },
      {
        'name': 'Office expenses',
        'icon': 'assets/icons/category5.png',
      },
      {
        'name': 'Consumables',
        'icon': 'assets/icons/category6.png',
      },
      {
        'name': 'Transport',
        'icon': 'assets/icons/category7.png',
      },
      {
        'name': 'Taxes and insurance',
        'icon': 'assets/icons/category8.png',
      },
      {
        'name': 'Miscellaneous',
        'icon': 'assets/icons/category9.png',
      },
    ];

    return CustomContainerBagraoundColor(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<CreateUserModel>(
            builder: (context, createUserModel, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Colors.white),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const SizedBox(width: 55),
                        const Text(
                          'Adding Expenses',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFieldUi(
                    text1: 'Title',
                    text2: 'Write Title',
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFieldUi(
                    text1: 'Amount',
                    text2: 'Write Amount',
                    controller: amountController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an amount';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Category',
                    style: TextStyle(
                      color: Color(0xFF100A60),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<String>(
                    value: selectedCategory,
                    decoration: InputDecoration(
                      hintText: 'Choose Category',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    items: categories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category['name'],
                        child: Row(
                          children: [
                            Image.asset(category['icon']),
                            const SizedBox(width: 8),
                            Text(category['name']),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedCategory = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFieldUi(
                    text1: 'Transaction date',
                    text2: 'Write Date',
                    controller: transactionDateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a date';
                      }
                      return null;
                    },
                  ),
                  const Spacer(),
                  Center(
                    child: CustomButton(
                      height: 4.1.h,
                      width: 40.w,
                      onPressed: () {
                        if (Form.of(context).validate() ?? false) {
                          createUserModel.setTitle(titleController.text);
                          createUserModel.setAmount(amountController.text);
                          createUserModel
                              .setSelectedCategory(selectedCategory!);
                          createUserModel.setTransactionDate(
                              transactionDateController.text);
                          // Navigate to the next screen or perform the next action
                        }
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
                  const SizedBox(height: 16),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
