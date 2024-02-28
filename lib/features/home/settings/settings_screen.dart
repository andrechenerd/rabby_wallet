import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/app/navigation/app_navigator.dart';
import 'package:rabby_wallet/app/navigation/routes.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/dialogs/settings_dialog.dart';
import 'package:rabby_wallet/core/ui_components/others/range_button.dart';
import 'package:rabby_wallet/data/repositories/hive_repo.dart';
import 'package:rabby_wallet/features/home/settings/components/app_bar.dart';
import 'package:rabby_wallet/features/home/settings/components/settings_item.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final AppNavigator navigator;
  late HiveRepo repo;
  @override
  void initState() {
    repo = HiveRepo();
    navigator = context.read();
    super.initState();
  }

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
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SettingsItem.light(
                          onTap: () {
                            showRestartpDialog(
                              context,
                              onPositiveAnswerButtonTap: () {
                                Navigator.pop(context);
                              },
                            );
                          },
                          icon: AppIcons.lockFilled,
                          text: "Lock Now",
                          rightWidget: Image.asset(
                            AppIcons.arrowRigth,
                            color: AppColors.white,
                            width: 24,
                          ),
                        ).onlyPadding(bottom: 24),
                        SettingsItem.light(
                          icon: AppIcons.scanFilled,
                          text: "Scan QR",
                          rightWidget: Image.asset(
                            AppIcons.arrowRigth,
                            color: AppColors.white,
                            width: 24,
                          ),
                        ).onlyPadding(bottom: 24),
                        SettingsItem.light(
                          onTap: () {
                            navigator.pushNamed(
                              routeName: Routes.connectedSites,
                            );
                          },
                          icon: AppIcons.connectedSitesFilled,
                          text: "Connected Sites",
                          rightWidget: Image.asset(
                            AppIcons.arrowRigth,
                            color: AppColors.white,
                            width: 24,
                          ),
                        ),
                      ],
                    ),
                  ).onlyPadding(top: 14, bottom: 12),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "General",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryGrey,
                          ),
                        ).onlyPadding(bottom: 16),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SettingsItem.dark(
                              onTap: () {
                                navigator.pushNamed(
                                  routeName: Routes.rpcNodes,
                                );
                              },
                              icon: AppIcons.geminiFilled,
                              text: "RPC Node",
                              rightWidget: Image.asset(
                                AppIcons.arrowRigth,
                                color: AppColors.lightBlue,
                                width: 24,
                              ),
                            ).onlyPadding(bottom: 24),
                            SettingsItem.dark(
                              onTap: () {
                                navigator.pushNamed(
                                  routeName: Routes.theme,
                                );
                              },
                              icon: AppIcons.themeFilled,
                              text: "Theme",
                              secondaryText: "Light",
                              rightWidget: Image.asset(
                                AppIcons.arrowRigth,
                                color: AppColors.lightBlue,
                                width: 24,
                              ),
                            ).onlyPadding(bottom: 24),
                            SettingsItem.dark(
                              onTap: () {
                                navigator.pushNamed(
                                  routeName: Routes.language,
                                );
                              },
                              icon: AppIcons.languageFilled,
                              text: "Language",
                              secondaryText: "English",
                              rightWidget: Image.asset(
                                AppIcons.arrowRigth,
                                color: AppColors.lightBlue,
                                width: 24,
                              ),
                            ).onlyPadding(bottom: 24),
                            SettingsItem.dark(
                              onTap: () {
                                navigator.pushNamed(
                                  routeName: Routes.defaultCurrency,
                                );
                              },
                              icon: AppIcons.defaultCurrencyFilled,
                              text: "Default Currency",
                              secondaryText: repo.savedCurrency,
                              rightWidget: Image.asset(
                                AppIcons.arrowRigth,
                                color: AppColors.lightBlue,
                                width: 24,
                              ),
                            ).onlyPadding(bottom: 24),
                            SettingsItem.dark(
                              onTap: () {
                                navigator.pushNamed(
                                  routeName: Routes.soundAndVibration,
                                );
                              },
                              icon: AppIcons.voiceFilled,
                              text: "Sound & Vibration",
                              rightWidget: Image.asset(
                                AppIcons.arrowRigth,
                                color: AppColors.lightBlue,
                                width: 24,
                              ),
                            ).onlyPadding(bottom: 24),
                          ],
                        ).symmetricPadding(horizontal: 8),
                        const Text(
                          "Security",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryGrey,
                          ),
                        ).symmetricPadding(vertical: 16),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SettingsItem.dark(
                              icon: AppIcons.geminiFilled,
                              text: "Change Passcode",
                              rightWidget: Image.asset(
                                AppIcons.arrowRigth,
                                color: AppColors.lightBlue,
                                width: 24,
                              ),
                            ).onlyPadding(bottom: 24),
                            SettingsItem.dark(
                              icon: AppIcons.touchFilled,
                              text: "Touch ID",
                              rightWidget: const RangeButton(isSelected: false),
                            ).onlyPadding(bottom: 24),
                            SettingsItem.dark(
                              icon: AppIcons.autoLockAppFilled,
                              text: "App Auto-lock",
                              rightWidget: const RangeButton(isSelected: true),
                            ).onlyPadding(bottom: 24),
                            SettingsItem.dark(
                              onTap: () {
                                navigator.pushNamed(
                                  routeName: Routes.autoLockTimer,
                                );
                              },
                              icon: AppIcons.autoLockTimerFilled,
                              text: "Auto-Lock Timmer",
                              secondaryText: "1 Hour",
                              rightWidget: Image.asset(
                                AppIcons.arrowRigth,
                                color: AppColors.lightBlue,
                                width: 24,
                              ),
                            ).onlyPadding(bottom: 24),
                            SettingsItem.dark(
                              onTap: () {
                                navigator.pushNamed(
                                  routeName: Routes.protection,
                                );
                              },
                              icon: AppIcons.protectionFilled,
                              text: "Protection",
                              rightWidget: Image.asset(
                                AppIcons.arrowRigth,
                                color: AppColors.lightBlue,
                                width: 24,
                              ),
                            ).onlyPadding(bottom: 24),
                            SettingsItem.dark(
                              onTap: () {
                                showResetAppDialog(
                                  context,
                                  textFieldCTRL: TextEditingController(),
                                  onPositiveAnswerButtonTap: () {
                                    Navigator.pop(context);
                                  },
                                );
                              },
                              icon: AppIcons.resetAppFilled,
                              text: "Reset App",
                              rightWidget: Image.asset(
                                AppIcons.arrowRigth,
                                color: AppColors.lightBlue,
                                width: 24,
                              ),
                            ).onlyPadding(bottom: 24),
                          ],
                        ).symmetricPadding(horizontal: 8),
                        const Text(
                          "Alert",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryGrey,
                          ),
                        ).symmetricPadding(vertical: 16),
                        SettingsItem.dark(
                          onTap: () {
                            navigator.pushNamed(
                              routeName: Routes.notifications,
                            );
                          },
                          icon: AppIcons.notificationFilled,
                          text: "Notification",
                          rightWidget: Image.asset(
                            AppIcons.arrowRigth,
                            color: AppColors.lightBlue,
                            width: 24,
                          ),
                        ).onlyPadding(
                          bottom: 24,
                          left: 8,
                          right: 8,
                        ),
                        const Text(
                          "About",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryGrey,
                          ),
                        ).symmetricPadding(vertical: 16),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SettingsItem.dark(
                              icon: AppIcons.versionFilled,
                              text: "Version",
                              secondaryText: "1.0.0-2022010100",
                            ).onlyPadding(bottom: 24),
                            SettingsItem.dark(
                              icon: AppIcons.stateLogsFilled,
                              text: "State Logs",
                              secondaryText: "Export",
                            )
                          ],
                        ).symmetricPadding(horizontal: 8),
                      ],
                    ),
                  ),
                  const Text(
                    "This will help support debug any issue you might encounter. Please send to support@rabby.com or support only.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryBlue,
                    ),
                    textAlign: TextAlign.center,
                  ).symmetricPadding(vertical: 30),
                ],
              ).expanded(),
            ],
          ).symmetricPadding(horizontal: 16),
        ),
      ),
    );
  }
}
