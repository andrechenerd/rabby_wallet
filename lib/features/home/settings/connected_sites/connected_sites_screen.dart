import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/dialogs/settings_dialog.dart';
import 'package:rabby_wallet/core/ui_components/others/app_expandable_button.dart';
import 'package:rabby_wallet/features/home/settings/components/app_bar.dart';

class ConnectedSitesScreen extends StatefulWidget {
  const ConnectedSitesScreen({super.key});

  @override
  State<ConnectedSitesScreen> createState() => _ConnectedSitesScreenState();
}

class _ConnectedSitesScreenState extends State<ConnectedSitesScreen> {
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
                        AppIcons.connectedSitesOutlined,
                        width: 24,
                        color: AppColors.darkGrey,
                      ).onlyPadding(
                        right: 16,
                      ),
                      const Text(
                        "Connected Sites",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryGrey,
                        ),
                      ),
                    ],
                  ).onlyPadding(top: 14, bottom: 26),
                  Row(
                    children: [
                      AppExpandableButton(
                        bgColor: AppColors.lightBlue,
                        contentColor: AppColors.primaryBlue,
                        text: "Add",
                        icon: AppIcons.addSquareOutlined,
                        onTap: () {
                          showConnectedSitesDialog(
                            context,
                            textFieldCTRL: TextEditingController(),
                            onPositiveAnswerButtonTap: () {
                              Navigator.pop(context);
                            },
                            onPasteFromClipboard: () {},
                          );
                        },
                      ).onlyPadding(right: 7).expanded(),
                      AppExpandableButton(
                        bgColor: AppColors.lightBlue,
                        contentColor: AppColors.primaryBlue,
                        text: "Scan",
                        icon: AppIcons.scan2,
                        onTap: () {
                          //
                        },
                      ).expanded(),
                    ],
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "WalletConnect",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryGrey,
                          ),
                        ).expanded(),
                        Image.asset(
                          AppIcons.scan2,
                          width: 20,
                          color: AppColors.primaryBlue,
                        ).onlyPadding(right: 10),
                        const Text(
                          "Scan to Connect",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                      ],
                    ),
                  ).symmetricPadding(vertical: 40),
                  const Text(
                    "No Connected sites",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryGrey,
                    ),
                  ).onlyPadding(top: 4).center(),
                  const Text(
                    "Creating neew connection with dApps.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkGrey,
                    ),
                  ).onlyPadding(top: 4).center(),
                ],
              ).expanded(),
            ],
          ).symmetricPadding(horizontal: 16),
        ),
      ),
    );
  }
}
