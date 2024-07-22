import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.text,
      required this.width,
      required this.height,
      required this.onPressed});
  final Widget? text;
  final double width;
  final double height;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment(-1.00, 0.00),
                end: Alignment(1, 0),
                colors: [
                  Color(0xFF100744),
                  Color(0xFF719EE0),
                ],
              ),
              borderRadius: BorderRadius.circular(37)),
          child: text,
        ),
      ),
    );
  }
}
