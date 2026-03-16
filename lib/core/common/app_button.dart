import 'package:flutter/material.dart';
import 'app_text.dart';

enum ButtonType { elevated, outlined }

class CustomIconButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final double? width;
  final double? height;
  final double iconSize;
  final bool isLoading;
  final FontSize? textSize;
  final FontWeightOption? textWeight;
  final Color buttonColor;
  final Color iconColor;
  final Color textColor;
  final VoidCallback onPressed;
  final ButtonType buttonType;

  const CustomIconButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.width,
    this.height,
    this.iconSize = 24,
    this.textSize,
    this.textWeight,
    this.buttonColor = Colors.blue,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
    this.isLoading = false,
    this.buttonType = ButtonType.elevated,
  });

  @override
  Widget build(BuildContext context) {
    final childWidget = isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: AppText(
                  text: text,
                  size: textSize,
                  weight: textWeight,
                  color: textColor,
                ),
              ),
              if (icon != null) const SizedBox(width: 6),
              if (icon != null) Icon(icon, size: iconSize, color: iconColor),
            ],
          );

    Widget button;

    switch (buttonType) {
      case ButtonType.outlined:
        button = OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: buttonColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: childWidget,
        );
        break;

      case ButtonType.elevated:
        button = ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: childWidget,
        );
        break;
    }

    return SizedBox(width: width, height: height, child: button);
  }
}
