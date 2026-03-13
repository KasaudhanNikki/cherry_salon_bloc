import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final Color? titleColor;
  final bool centerTitle;
  final EdgeInsetsGeometry? padding;
  final double? leadingWidth;
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.titleColor,
    this.centerTitle = true,
    this.padding, this.leadingWidth,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth,
      title: Text(
        title ?? "",
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
      actionsPadding: padding,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
