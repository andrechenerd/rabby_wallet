// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';

import '../../../core/constants/app_colors.dart';

class ReceptionTypeBox extends StatelessWidget {
  final bool isFast;
  const ReceptionTypeBox({
    Key? key,
    required this.isFast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            isFast ? AppIcons.flashCircle : AppIcons.timerStart,
            height: 20,
          ),
          const Text(
            "Transaction fee",
            style: TextStyle(
              fontSize: 12,
              color: AppColors.darkGrey,
            ),
          ).onlyPadding(left: 5),
          const Spacer(),
          isFast
              ? const Row(
                  children: [
                    Text(
                      "Instant ",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "(0 to 30 minutes)",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              : const Text(
                  "2 hours in average",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ],
      ),
    );
  }
}
