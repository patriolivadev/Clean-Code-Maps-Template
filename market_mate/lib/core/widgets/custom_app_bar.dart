import 'package:flutter/material.dart';
import 'package:market_mate/core/utils/themes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(90.0),
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 25),
        decoration: BoxDecoration(
          color: AppTheme.backgroundAppColor3,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            title,
            style: AppTheme.titleTheme,
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90.0);
}
