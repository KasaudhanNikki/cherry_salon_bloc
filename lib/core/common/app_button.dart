import 'package:bloc_setup/core/theme/colors.dart';
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
                  size: FontSize.M,
                  weight: FontWeightOption.semiBold,
                  color: buttonType == ButtonType.elevated
                      ? AppColors.background(context)
                      : AppColors.primary,
                ),
              ),
              if (icon != null) const SizedBox(width: 6),
              if (icon != null)
                Icon(
                  icon,
                  size: iconSize,
                  color: AppColors.background(context),
                ),
            ],
          );

    Widget button;

    switch (buttonType) {
      case ButtonType.outlined:
        button = OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: AppColors.primary),
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
            backgroundColor: AppColors.primary,
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
