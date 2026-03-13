import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color iconColor;
  final Function(String)? onChanged;
  final VoidCallback? onSuffixTap;
  final BorderRadius borderRadius;
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.validator,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.iconColor = Colors.blue,
    this.suffixIcon,
    this.onChanged,
    this.onSuffixTap,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, color: iconColor),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon, color: iconColor),
                onPressed: onSuffixTap,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: focusedBorderColor, width: 2),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
