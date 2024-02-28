import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';
import 'package:rabby_wallet/features/home/swap/components/swap_app_bar.dart';
import 'package:rabby_wallet/features/home/swap/components/swap_tile_widget.dart';
import 'package:rabby_wallet/features/home/swap/components/swap_widget.dart';

class SwapScreen extends StatefulWidget {
  const SwapScreen({super.key});

  @override
  State<SwapScreen> createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.secondaryWhite,
        body: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                const SwapScreenAppBar().onlyPadding(top: 18),
                ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    const SwapWidget().onlyPadding(top: 5),
                    const SwapTileWidget(
                      leftText: "Slippage",
                      leftIcon: AppIcons.infoCircleOutlined,
                      rightText: "0.5 %",
                      rightIcon: AppIcons.dropRight,
                    ).onlyPadding(top: 12),
                    const SwapTileWidget(
                      leftText: "Gas fee",
                      rightText: "Fast-\$",
                      rightIcon: AppIcons.dropRight,
                    ).onlyPadding(top: 12),
                    const SwapTileWidget(
                      leftText: "Rabby fee",
                      leftIcon: AppIcons.infoCircleOutlined,
                      rightText: "0.3 %",
                      rightIcon: AppIcons.messageQuestionOutlined,
                    ).onlyPadding(top: 12, bottom: 20),
                  ],
                ).expanded(),
                AppButton(
                  text: "Swap",
                  bgColor: AppColors.darkGrey,
                  textColor: AppColors.white,
                  onTap: () {},horizontalMargin: 0,
                ).onlyPadding(top: 10,bottom: 40),
              ],
            ).symmetricPadding(horizontal: 20),
          ),
        ),
      ),
    );
  }
}
