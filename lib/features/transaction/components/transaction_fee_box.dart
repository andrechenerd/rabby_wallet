import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class TransactionFeeBox extends StatelessWidget {
  final double price;
  const TransactionFeeBox({
    Key? key,
    required this.price,
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
          const Text(
            "Transaction fee",
            style: TextStyle(
              fontSize: 12,
              color: AppColors.darkGrey,
            ),
          ),
          const Spacer(),
          Text(
            "$price USD",
            style: const TextStyle(
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
