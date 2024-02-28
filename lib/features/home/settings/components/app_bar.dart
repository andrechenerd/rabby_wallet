// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';

import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({
    Key? key,
    this.text = "Settings",
    this.color = AppColors.primaryGrey,
    this.onBackTap,
  }) : super(key: key);
  final String text;
  final Color color;
  final VoidCallback? onBackTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBackTap ?? () {
            Navigator.pop(context);
          },
          child: Image.asset(
            AppIcons.arrowBack,
            width: 20,
            height: 20,
            color: color,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ).onlyPadding(left: 20),
        ),
      ],
    ).symmetricPadding(vertical: 10);
  }
}
