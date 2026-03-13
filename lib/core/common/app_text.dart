import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../utils/utils.dart';

class AppText extends StatelessWidget {
  /// A customizable text widget for consistent styling across the app.
  final String? text;

  /// Font weight of the text.
  final FontWeightOption? weight;
  final FontSize? size;
  final Color? color;
  final Color? decorColor;
  final TextAlign? align;
  const AppText({
    super.key,
    this.text,
    this.weight,
    this.size,
    this.color,
    this.decorColor, this.align,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Utils.isDark(context: context);
    return Text(
      text ?? '',
      textAlign: align,
      style: TextStyle(

        fontWeight: weight?.value ?? FontWeight.w500,
        fontSize: size?.value ?? 14.0,
        color: color ?? (isDark ? AppColors.white : AppColors.black),
        decorationColor:
            decorColor ?? (isDark ? AppColors.white : AppColors.black),
      ),
    );
  }
}

enum FontSize {
  /// Extra small size - 12.0.
  XS(12.0),

  /// Small size - 14.0
  S(14.0),

  /// Medium size - 16.0
  M(16.0),

  /// Large size - 18.0
  L(18.0),

  /// Extra large size - 20.0
  XL(20.0),

  /// Extra extra large size - 24.0
  XXL(24.0),

  /// Extra extra extra large size - 30.0
  XXXL(30.0);

  final double value;
  const FontSize(this.value);
}

enum FontWeightOption {
  /// Light weight - FontWeight.w100.
  light(FontWeight.w300),

  /// Regular weight - FontWeight.w400.
  regular(FontWeight.w400),

  /// Medium weight - FontWeight.w500.
  medium(FontWeight.w500),

  /// Semi-bold weight - FontWeight.w600.
  semiBold(FontWeight.w600),

  /// Bold weight - FontWeight.w700.
  bold(FontWeight.w700),

  /// Extra-bold weight - FontWeight.w800.
  extraBold(FontWeight.w800);

  final FontWeight value;
  const FontWeightOption(this.value);
}
