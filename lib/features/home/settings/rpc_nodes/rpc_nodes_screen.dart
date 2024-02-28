import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/dialogs/settings_dialog.dart';
import 'package:rabby_wallet/core/ui_components/others/app_expandable_button.dart';
import 'package:rabby_wallet/features/home/settings/components/app_bar.dart';
import 'package:rabby_wallet/features/home/settings/rpc_nodes/components/connection_widget.dart';

class RpcNodesScreen extends StatefulWidget {
  const RpcNodesScreen({super.key});

  @override
  State<RpcNodesScreen> createState() => _RpcNodesScreenState();
}

class _RpcNodesScreenState extends State<RpcNodesScreen> {
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
                        AppIcons.geminiOutlined,
                        width: 24,
                      ).onlyPadding(right: 16),
                      const Text(
                        "RPC Node",
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 28, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "What’s the “Height” of nodes?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryGrey,
                          ),
                        ),
                        Text(
                          "The larger number of height means that the nodes have more stable and in-time synchronization. When the nodes are connected at similar speeds, it is recommended to choose the one which has a higher height.",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Custom",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryGrey,
                          ),
                        ).expanded(),
                        AppExpandableButton(
                          bgColor: AppColors.lightBlue,
                          contentColor: AppColors.primaryBlue,
                          text: "Add",
                          icon: AppIcons.addCircleOutlined,
                          onTap: () {
                            showAddNodeDialog(
                              context,
                              textFieldCTRL: TextEditingController(),
                              onPositiveAnswerButtonTap: () {
                                Navigator.pop(context);
                              },
                              onPasteFromClipboard: () {},
                            );
                          },
                        ),
                      ],
                    ),
                  ).symmetricPadding(vertical: 12),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        9,
                        (index) {
                          return ConnectionWidget(
                            link: "https://mainnet-eth.compound.finance",
                            ms: index < 5
                                ? 155
                                : index < 7
                                    ? 800
                                    : 1000,
                            height: 16885049,
                            isSelected: index == 0,
                          ).onlyPadding(bottom: index <8 ? 14 : 0);
                        },
                      ),
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
