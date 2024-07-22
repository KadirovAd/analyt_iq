import 'package:flutter/material.dart';
import 'package:history_trade/src/components/textfild/textfild_ui.dart';
import 'package:history_trade/src/models/user/user_model.dart';
import 'package:history_trade/src/presemtation/adding_data/add_expenses/add_expenses_screens.dart';
import 'package:provider/provider.dart';
import 'package:history_trade/src/components/buttons/custom_button.dart';
import 'package:history_trade/src/components/container/custom_container_bagraound_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddingIncomeScreen extends StatefulWidget {
  const AddingIncomeScreen({super.key});

  @override
  State<AddingIncomeScreen> createState() => _AddingIncomeScreenState();
}

class _AddingIncomeScreenState extends State<AddingIncomeScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController newNameController = TextEditingController();
  final TextEditingController newIdController = TextEditingController();
  final TextEditingController transactionDateController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _dialogFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final createUserModel = Provider.of<CreateUserModel>(context);

    return CustomContainerBagraoundColor(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
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
                        'Adding Income',
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
                  'Client',
                  style: TextStyle(
                    color: Color(0xFF100A60),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: createUserModel.selectedClient,
                  decoration: InputDecoration(
                    hintText: 'Choose Client',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  items: createUserModel.clients
                      .map((client) => DropdownMenuItem<String>(
                            value: client,
                            child: Text(client),
                          ))
                      .toList(),
                  onChanged: (value) {
                    createUserModel.setSelectedClient(value!);
                  },
                ),
                const SizedBox(height: 8),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    Color(0xFF056ED0),
                                    Color(0xFF84B3F9)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              width: 90.w,
                              padding: const EdgeInsets.all(16.0),
                              child: Form(
                                key: _dialogFormKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'New Client',
                                          style: TextStyle(
                                            color: Color(0xFF100A60),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          icon: const Icon(Icons.close,
                                              color: Color(0xFF100A60)),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      controller: newNameController,
                                      decoration: InputDecoration(
                                        hintText: 'Write Name',
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a name';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      controller: newIdController,
                                      decoration: InputDecoration(
                                        hintText: 'Write ID',
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter an ID';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 24),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (_dialogFormKey.currentState
                                                ?.validate() ??
                                            false) {
                                          createUserModel.addClient(
                                              newNameController.text);
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0x33100A60),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(29.0),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 40.0,
                                          vertical: 12.0,
                                        ),
                                      ),
                                      child: const Text(
                                        'Add',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0x33100A60),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 2,
                          color: Color(0xFF719EE0),
                        ),
                        borderRadius: BorderRadius.circular(29),
                      ),
                    ),
                    child: const Text(
                      'Add New Client',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF100A60),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
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
                      if (_formKey.currentState?.validate() ?? false) {
                        createUserModel.setAmount(amountController.text);
                        createUserModel
                            .setTransactionDate(transactionDateController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddExpensesScreens(),
                          ),
                        );
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
            ),
          ),
        ),
      ),
    );
  }
}
