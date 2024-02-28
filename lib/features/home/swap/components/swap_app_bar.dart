import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';

class SwapScreenAppBar extends StatelessWidget {
  const SwapScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            AppIcons.arrowBack,
            width: 20,
            height: 20,
            color: AppColors.lightBlack,
          ),
        ),
        const Text(
          "Swap",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.lightBlack,
          ),
        ).onlyPadding(left: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              AppIcons.etherium,
              width: 24,
              height: 24,
            ).onlyPadding(right: 8),
            const Text(
              "Optimism",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.lightBlack,
              ),
            ).onlyPadding(right: 6),
            const Text(
              "OP",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.darkGrey,
              ),
            ).onlyPadding(right: 15),
            Image.asset(
              AppIcons.dropDown,
              width: 20,
              height: 20,
            ),
          ],
        ).expanded(),
      ],
    ).symmetricPadding(vertical: 10);
  }
}
