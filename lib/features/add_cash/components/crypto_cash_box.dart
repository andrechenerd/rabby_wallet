import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import '../../../core/constants/app_colors.dart';

class CryptoCrashBox extends StatelessWidget {
  final String cryptoName;
  final String imagePath;
  const CryptoCrashBox({
    super.key,
    required this.cryptoName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          height: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cryptoName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryGrey,
                )),
            const Text(
              "OP",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.darkGrey,
              ),
            ),
          ],
        ).onlyPadding(left: 16),
        const Spacer(),
        Image.asset(
          AppIcons.arrowRigth,
          height: 24,
          color: AppColors.primaryGrey,
        ),
      ],
    );
  }
}
