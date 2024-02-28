import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';

class SmallButtonWithIcon extends StatelessWidget {
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;
  final Color? imageColor;
  final String iconPath;
  final String title;
  const SmallButtonWithIcon({
    super.key,
    required this.onTap,
    this.color = Colors.white,
    this.textColor = AppColors.primaryBlue,
    required this.iconPath,
    required this.title,
    this.imageColor=AppColors.primaryBlue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              color: imageColor,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ).onlyPadding(left: 5),
          ],
        ),
      ),
    );
  }
}
