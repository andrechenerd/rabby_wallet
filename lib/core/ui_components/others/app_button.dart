// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';

import '../../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.horizontalMargin = 20,
    this.bgColor = AppColors.primaryBlue,
    this.textColor = AppColors.white,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final double horizontalMargin;
  final Color? bgColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: 51,
        decoration: BoxDecoration(
          color: bgColor,
          gradient: bgColor == null
              ? const LinearGradient(
                  colors: [
                    Color(0xFF88ABFF),
                    Color(0xFF7983FF),
                  ],
                )
              : null,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w700, color: textColor),
        ),
      ),
    ).symmetricPadding(horizontal: horizontalMargin);
  }
}
