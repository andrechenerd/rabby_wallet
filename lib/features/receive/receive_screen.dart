import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_images.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/features/home/settings/components/app_bar.dart';

import '../../core/constants/app_icons.dart';
import '../../core/ui_components/others/app_expandable_button.dart';
import 'components/qr_widget.dart';

class ReceiveScreenBuilder extends StatelessWidget {
  const ReceiveScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReceiveScreen();
  }
}

class ReceiveScreen extends StatelessWidget {
  const ReceiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 30, 16, 20),
        children: [
          const SettingsAppBar(
            text: "Receive",
          ),
          Row(
            children: [
              Image.asset(
                AppImages.rabbitLogo,
                color: AppColors.primaryBlue,
                height: 44,
              ),
              const Text(
                "Wallet",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryGrey,
                  fontWeight: FontWeight.w400,
                ),
              ).onlyPadding(left: 16),
            ],
          ).onlyPadding(top: 20, bottom: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wallet 1",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  "0xDACa159F870Ba0DAba0708d8794c2Ec9d988f6B4",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const QRWidget(),
          Row(
            children: [
              AppExpandableButton(
                icon: AppIcons.copy,
                bgColor: AppColors.white,
                contentColor: AppColors.primaryGrey,
                text: "Copy address",
                onTap: () {},
              ).expanded(),
              const SizedBox(
                width: 15,
              ),
              AppExpandableButton(
                icon: AppIcons.share,
                bgColor: AppColors.white,
                contentColor: AppColors.primaryGrey,
                text: "Share address",
                onTap: () {},
              ).expanded(),
            ],
          ).onlyPadding(top: 23)
        ],
      ),
    ));
  }
}
