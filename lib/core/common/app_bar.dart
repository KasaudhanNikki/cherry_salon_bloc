import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final Color? titleColor;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.titleColor,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: titleColor ?? Colors.black,
        ),
      ),
      centerTitle: centerTitle,
      elevation: 0,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}