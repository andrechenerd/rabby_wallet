import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/constants/app_images.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';


class HomeAppBar extends StatelessWidget {
  final VoidCallback onSettingsTap;
  final VoidCallback onDotsTap;
  const HomeAppBar({super.key, required this.onSettingsTap, required this.onDotsTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 32,
          padding: const EdgeInsets.all(5),
          width: 32,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryBlue,
              )),
          child: Image.asset(
            AppImages.rabbitLogo,
            color: AppColors.primaryBlue,
          ),
        ),
        const Text(
          "Wallet 1",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryBlue,
          ),
        ).onlyPadding(left: 14),
        const Spacer(),
        GestureDetector(
          onTap:onSettingsTap ,
          child: Image.asset(
            AppIcons.settings,
            height: 24,
          ),
        ),
        Image.asset(
          AppIcons.dots,
          height: 24,
        ).onlyPadding(left: 14),
      ],
    ).paddingLTRB(16, 26, 16, 0);
  }
}
