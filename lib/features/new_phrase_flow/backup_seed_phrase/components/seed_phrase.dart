import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';

class SeedPhraseItem extends StatelessWidget {
  final int index;
  final String phrase;

  const SeedPhraseItem({
    super.key,
    required this.index,
    required this.phrase,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(55),
        color: AppColors.secondaryWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            index.toString(),
            style: const TextStyle(fontSize: 12, color: AppColors.lightBlue),
          ),
          Text(
            phrase,
            style: const TextStyle(fontSize: 16, color: AppColors.primaryGrey),
          ),
          Text(
            index.toString(),
            style: const TextStyle(fontSize: 12, color: AppColors.transparent),
          ),
        ],
      ),
    );
  }
}
