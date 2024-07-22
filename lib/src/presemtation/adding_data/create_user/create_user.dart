import 'package:flutter/material.dart';
import 'package:history_trade/src/models/user/user_model.dart';
import 'package:provider/provider.dart';
import 'package:history_trade/src/components/widgets/buttons/custom_button.dart';
import 'package:history_trade/src/components/container/custom_container_bagraound_color.dart';
import 'package:history_trade/src/presemtation/adding_data/select_currency_screen/select_currency_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreateUserModel(),
      child: CustomContainerBagraoundColor(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Text(
                      'Create profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'Solway',
                        fontWeight: FontWeight.w700,
                        height: 0.03,
                        letterSpacing: -0.32,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 4.h),
                const Text(
                  'Amount',
                  style: TextStyle(
                    color: Color(0xFF100A60),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Consumer<CreateUserModel>(
                    builder: (context, model, child) {
                      return TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Write Amount',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an amount';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          if (value != null) {
                            model.setAmount(value);
                          }
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 4.h),
                const Text(
                  'Choose Avatar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Consumer<CreateUserModel>(
                    builder: (context, model, child) {
                      return GridView.count(
                        crossAxisCount: 3,
                        padding: const EdgeInsets.all(16.0),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: List.generate(9, (index) {
                          return GestureDetector(
                            onTap: () {
                              model.selectAvatar(index);
                            },
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor:
                                  model.selectedAvatarIndex == index
                                      ? Colors.white
                                      : Colors.transparent,
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(
                                    'assets/images/p${index + 1}.png'),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
                Center(
                  child: CustomButton(
                    height: 4.1.h,
                    width: 40.w,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectCurrencyScreen(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
