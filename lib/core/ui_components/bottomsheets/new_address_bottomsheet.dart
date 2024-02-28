import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';

class NewAddressBottomsheet extends StatelessWidget {
  const NewAddressBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 26, 16, 40),
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: AppColors.primaryBlue,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                AppIcons.arrowLeft,
                width: 20,
              ),
              const Text(
                'Create New Address',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ).onlyPadding(left: 20),
            ],
          ),
          const Text(
            'Before starting, please read and keep the following security points in mind',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
          ).onlyPadding(
            top: 28,
            bottom: 24,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 26,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.secondaryBlue,
            ),
            child: Column(
              children: [
                const Text(
                  'If i lose my seed phrase, my assets will be lost forever.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                const Text(
                  'If share my seed phrase with others, my assets will be stolen.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ).symmetricPadding(vertical: 16),
                const Text(
                  'The seed phrase is only stored on my computer, and Rabby has no access to it.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ).onlyPadding(bottom: 16),
                const Text(
                  'If I uninstall Rabby without backing up the seed phrase, Rabby cannot retrive it for me.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          const Spacer(),
          AppButton(
            text: "Show Seed Phrase",
            onTap: () => Navigator.pop(context),
            bgColor: AppColors.white,
            textColor: AppColors.primaryBlue,
            horizontalMargin: 0,
          ),
        ],
      ),
    );
  }
}
