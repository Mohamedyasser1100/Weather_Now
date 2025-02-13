import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton(
      {super.key,
      required this.text,
      required this.color,
      required this.onTap,
      required this.textColor});

  final String text;
  final Color color;
  final Color textColor;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.9,
        height: height * 0.06,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: textColor)),
        ),
      ),
    );
  }
}
