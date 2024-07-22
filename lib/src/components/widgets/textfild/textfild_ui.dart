import 'package:flutter/material.dart';

class TextFieldUi extends StatelessWidget {
  const TextFieldUi({
    super.key,
    required this.text1,
    required this.text2,
    required this.controller,
    required this.validator,
  });

  final String text1;
  final String text2;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: const TextStyle(
            color: Color(0xFF100A60),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: text2,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
