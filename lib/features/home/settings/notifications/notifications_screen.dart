import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/app/navigation/app_navigator.dart';
import 'package:rabby_wallet/app/navigation/routes.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/range_button.dart';
import 'package:rabby_wallet/features/home/settings/components/app_bar.dart';
import 'package:rabby_wallet/features/home/settings/components/settings_item.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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
                        AppIcons.notificationOutlined,
                        width: 24,
                      ).onlyPadding(right: 16),
                      const Text(
                        "Notification",
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SettingsItem.dark(
                          text: "Notification",
                          rightWidget: const RangeButton(isSelected: false),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Receive notifications of account activities and asset changes.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryGrey,
                    ),
                  ).symmetricPadding(horizontal: 9, vertical: 11),
                  const Text(
                    "Market",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryGrey,
                    ),
                  ).symmetricPadding(horizontal: 9, vertical: 12),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: Column(
                      children: [
                        SettingsItem.dark(
                          height: null,
                          text: "BTC and ETH Movement",
                          subText:
                              "Large price fluctuations in BTC and ETH prices",
                          rightWidget: const RangeButton(isSelected: false),
                        ).onlyPadding(bottom: 24),
                        SettingsItem.dark(
                          height: null,
                          text: "Favorite",
                          subText:
                              "Large price fluctuations of your favorite assets",
                          rightWidget: const RangeButton(isSelected: false),
                        ).onlyPadding(bottom: 24),
                        SettingsItem.dark(
                          onTap: () {
                            context.read<AppNavigator>().pushNamed(
                              routeName: Routes.manageThreshold,
                            );
                          },
                          text: "Manage Threshold",
                          secondaryText: "5%",
                          rightWidget: Image.asset(
                            AppIcons.arrowRigth,
                            color: AppColors.lightBlue,
                            width: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Alert",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryGrey,
                    ),
                  ).paddingLTRB(9, 24, 9, 12),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: Column(
                      children: [
                        SettingsItem.dark(
                          height: null,
                          text: "Price Alert",
                          subText: "When token reaches the set price",
                          rightWidget: const RangeButton(isSelected: false),
                        ).onlyPadding(bottom: 24),
                        SettingsItem.dark(
                          text: "Manage",
                          secondaryText: "0",
                          rightWidget: Image.asset(
                            AppIcons.arrowRigth,
                            color: AppColors.lightBlue,
                            width: 24,
                          ),
                        ),
                      ],
                    ),
                  ).onlyPadding(bottom: 40),
                ],
              ).expanded(),
            ],
          ).symmetricPadding(horizontal: 16),
        ),
      ),
    );
  }
}
