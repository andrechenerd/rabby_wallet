import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class TransactionAmountBox extends StatelessWidget {
  final double cryptoPrice;
  final double dollarPrice;
  const TransactionAmountBox({
    super.key,
    required this.cryptoPrice,
    required this.dollarPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 2),
            blurRadius: 3,
            color: AppColors.lightBlue,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$dollarPrice USD",
            style: const TextStyle(
              fontSize: 34,
              color: AppColors.primaryGrey,
            ),
          ),
          Text(
            "$cryptoPrice ETH",
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
