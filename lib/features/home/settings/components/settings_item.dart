// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    Key? key,
    this.icon,
    this.iconColor,
    required this.text,
    required this.textColor,
    this.secondaryText,
    this.rightWidget,
    this.subText,
    this.subTextColor,
    this.height = 32,
    this.onTap,
  }) : super(key: key);
  final String? icon;
  final Color? iconColor;
  final String text;
  final String? subText;
  final Color? subTextColor;
  final Color textColor;
  final String? secondaryText;
  final Widget? rightWidget;
  final VoidCallback? onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: height,
        color: AppColors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null)
              SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  icon!,
                  height: 24,
                  color: iconColor,
                ),
              ).onlyPadding(right: 16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  ),
                  if (subText != null)
                    Text(
                      subText!,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: subTextColor ?? AppColors.darkGrey,
                      ),
                    )
                ],
              ).align(alignment: Alignment.centerLeft).onlyPadding(right: 16),
            ),
            if (secondaryText != null)
              Text(
                secondaryText!,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: iconColor,
                ),
              ).align(alignment: Alignment.centerRight),
            if (rightWidget != null) rightWidget!,
          ],
        ),
      ),
    );
  }

  factory SettingsItem.light({
    String? icon,
    required String text,
    Widget? rightWidget,
    VoidCallback? onTap,
    String? secondaryText,
  }) {
    return SettingsItem(
      icon: icon,
      iconColor: AppColors.white,
      text: text,
      textColor: AppColors.white,
      rightWidget: rightWidget,
      onTap: onTap,
      secondaryText: secondaryText,
    );
  }

  factory SettingsItem.dark({
    String? icon,
    required String text,
    Widget? rightWidget,
    VoidCallback? onTap,
    String? secondaryText,
    double? height = 32,
    String? subText,
    Color? subTextColor,
  }) {
    return SettingsItem(
      height: height,
      subText: subText,
      subTextColor: subTextColor,
      icon: icon,
      iconColor: AppColors.primaryBlue,
      text: text,
      textColor: AppColors.primaryGrey,
      rightWidget: rightWidget,
      onTap: onTap,
      secondaryText: secondaryText,
    );
  }
}
