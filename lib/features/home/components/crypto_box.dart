import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';

import '../../../core/constants/app_colors.dart';

class CryptoBox extends StatelessWidget {
  final String imagePath;
  final double price;
  final String cryptoName;
  final double priceDollar;
  final double procent;
  const CryptoBox({
    super.key,
    required this.imagePath,
    required this.price,
    required this.cryptoName,
    required this.priceDollar,
    required this.procent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Image.network(
            imagePath,
            height: 40,
            width: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(price.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryGrey,
                  )),
              Text(cryptoName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrey,
                  )),
            ],
          ).onlyPadding(left: 16),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("\$ $priceDollar",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryGrey,
                  )),
              Text("-$procent%",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightRed,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
