// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/hide_wallet_address.dart';

class RecieveSendButton extends StatelessWidget {
  final bool isResive;
  final String walletKey;
  final double avax;
  final DateTime dateTime;
  const RecieveSendButton({
    Key? key,
    required this.isResive,
    required this.walletKey,
    required this.avax,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDateTime = DateFormat("dd.MM.yyyy").format(dateTime);
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.transparent,
        child: Row(
          children: [
            Image.asset(
              isResive ? AppIcons.recieveActivity : AppIcons.sendActivity,
              height: 34,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isResive ? "Send" : "Reseive",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryGrey,
                  ),
                ),
                Text(
                  hideWalletAddress(walletKey),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ).onlyPadding(left: 16),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${avax.toString()} AVAX",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color:
                        isResive ? AppColors.primaryBlue : AppColors.lightGreen,
                  ),
                ),
                Text(
                  formattedDateTime,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
