import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/range_button.dart';
import 'package:rabby_wallet/features/home/settings/components/app_bar.dart';
import 'package:rabby_wallet/features/home/settings/components/settings_item.dart';

class AutoLockTimerScreen extends StatefulWidget {
  const AutoLockTimerScreen({super.key});

  @override
  State<AutoLockTimerScreen> createState() => _AutoLockTimerScreenState();
}

class _AutoLockTimerScreenState extends State<AutoLockTimerScreen> {
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
              ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppIcons.autoLockTimerOutlined,
                        width: 24,
                      ).onlyPadding(right: 16),
                      const Text(
                        "Auto-Lock Timer",
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
                          text: "Always",
                          rightWidget: const RangeButton(isSelected: false),
                        ).onlyPadding(bottom: 24),
                        SettingsItem.dark(
                          text: "1 Minutes",
                          rightWidget: const RangeButton(isSelected: true),
                        ).onlyPadding(bottom: 24),
                        SettingsItem.dark(
                          text: "5 Minutes",
                          rightWidget: const RangeButton(isSelected: false),
                        ).onlyPadding(bottom: 24),
                        SettingsItem.dark(
                          text: "30 Minutes",
                          rightWidget: const RangeButton(isSelected: false),
                        ).onlyPadding(bottom: 24),
                        SettingsItem.dark(
                          text: "1 Hour",
                          rightWidget: const RangeButton(isSelected: false),
                        ).onlyPadding(bottom: 24),
                        SettingsItem.dark(
                          text: "4 Hour",
                          rightWidget: const RangeButton(isSelected: false),
                        ),
                      ],
                    ),
                  ),
                ],
              ).expanded(),
            ],
          ).symmetricPadding(horizontal: 16),
        ),
      ),
    );
  }
}
