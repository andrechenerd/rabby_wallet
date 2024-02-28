import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/range_button.dart';
import 'package:rabby_wallet/features/home/settings/components/app_bar.dart';
import 'package:rabby_wallet/features/home/settings/components/settings_item.dart';

class ProtectionScreen extends StatefulWidget {
  const ProtectionScreen({super.key});

  @override
  State<ProtectionScreen> createState() => _ProtectionScreenState();
}

class _ProtectionScreenState extends State<ProtectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryWhite,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              const SettingsAppBar().onlyPadding(top: 18),
              Row(
                children: [
                  Image.asset(
                    AppIcons.protectionOutlined,
                    width: 24,
                  ).onlyPadding(right: 16),
                  const Text(
                    "Protection",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryGrey,
                    ),
                  )
                ],
              ).symmetricPadding(vertical: 14),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SettingsItem.dark(
                      text: "Create Transactions",
                      rightWidget: const RangeButton(isSelected: false),
                    ).onlyPadding(bottom: 24),
                    SettingsItem.dark(
                      text: "Create Transactions",
                      rightWidget: const RangeButton(isSelected: true),
                    ).onlyPadding(bottom: 24),
                    SettingsItem.dark(
                      text: "Create / Remove Accounts ",
                      rightWidget: const RangeButton(isSelected: false),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                "You password will be required in these\ncases even you’ve alredy unlocked Rabby",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryGrey,
                ),
                textAlign: TextAlign.center,
              ).onlyPadding(top: 20, bottom: 40, left: 20, right: 20)
            ],
          ).symmetricPadding(horizontal: 16),
        ),
      ),
    );
  }
}
