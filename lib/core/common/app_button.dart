import 'package:flutter/material.dart';
import 'app_text.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double? width;
  final double? height;
  final double iconSize;

  final FontSize? textSize;
  final FontWeightOption? textWeight;

  final Color buttonColor;
  final Color iconColor;
  final Color textColor;

  final VoidCallback onPressed;

  const CustomIconButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.width,
    this.height,
    this.iconSize = 24,
    this.textSize,
    this.textWeight,
    this.buttonColor = Colors.blue,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: text,
              size: textSize,
              weight: textWeight,
              color: textColor,
            ),
            const SizedBox(width: 8),
            Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}