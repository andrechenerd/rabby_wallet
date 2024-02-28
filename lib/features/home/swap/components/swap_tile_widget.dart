// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';

class SwapTileWidget extends StatelessWidget {
  const SwapTileWidget({
    Key? key,
    required this.leftText,
    this.leftIcon,
    required this.rightText,
    required this.rightIcon,
  }) : super(key: key);
  final String leftText;
  final String? leftIcon;
  final String rightText;
  final String rightIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            leftText,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.darkGrey,
            ),
          ).onlyPadding(right: 8),
          if (leftIcon != null)
            Image.asset(
              leftIcon!,
              width: 20,
              height: 20,
            ),
          const Spacer(),
          Text(
            rightText,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.lightBlack,
            ),
          ).onlyPadding(right: 2),
          Image.asset(
            rightIcon,
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }
}
