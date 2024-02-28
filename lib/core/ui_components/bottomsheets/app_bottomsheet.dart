import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/constants/app_images.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';

class AppBottomSheet extends StatelessWidget {
  final String title;
  final String subTitle;

  final VoidCallback onTap;
  const AppBottomSheet({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 40),
      height: 350,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    AppIcons.clear,
                    color: AppColors.white,
                  ),
                ),
              ),
              Image.asset(
                AppImages.rabbitLogo,
                height: 80,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                height: 20,
                width: 20,
              ),
            ],
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ).onlyPadding(top: 10),
          const Spacer(),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const Spacer(
            flex: 4,
          ),
          AppButton(
            text: "Continue",
            onTap: onTap,
            horizontalMargin: 80,
            bgColor: Colors.white,
            textColor: AppColors.primaryBlue,
          ),
        ],
      ),
    );
  }
}
