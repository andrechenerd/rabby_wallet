import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';
import '../../core/constants/app_icons.dart';
import 'components/crypto_cash_box.dart';

class AddCashScreenBuilder extends StatelessWidget {
  const AddCashScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddCashScreen();
  }
}

class AddCashScreen extends StatelessWidget {
  const AddCashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  AppIcons.arrowBack,
                  width: 20,
                  height: 20,
                  color: AppColors.primaryGrey,
                ),
              ),
              Expanded(
                child: const Text(
                  "Add Cash",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryGrey,
                  ),
                ).onlyPadding(left: 20),
              ),
              const Text(
                "Max",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryGrey,
                ),
              )
            ],
          ).symmetricPadding(vertical: 10),
          const CryptoCrashBox(
            cryptoName: "Optimism",
            imagePath: "assets/images/Tocen (1).png",
          ).onlyPadding(top: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "34",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryGrey,
                ),
              ),
              const Text(
                "USD",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryGrey,
                ),
              ).onlyPadding(bottom: 4)
            ],
          ).onlyPadding(top: 50),
          const Text(
            "Min: \$2",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.darkGrey,
            ),
          ),
          const Spacer(),
          AppButton(
            text: "Buy",
            onTap: () {},
            horizontalMargin: 0,
          )
        ],
      ).paddingLTRB(16, 30, 16, 20),
    ));
  }
}
