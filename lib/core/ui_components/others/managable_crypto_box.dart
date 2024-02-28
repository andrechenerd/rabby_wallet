import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';

class ManagableCryptoBox extends StatelessWidget {
  final String imagePath;
  final String coinName;
  final String coinShortName;
  const ManagableCryptoBox(
      {super.key,
      required this.imagePath,
      required this.coinName,
      required this.coinShortName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 40,
      width: MediaQuery.of(context).size.width,
      color: AppColors.transparent,
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Image.network(imagePath),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coinName,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryGrey,
                ),
              ),
              const Spacer(),
              Text(
                coinShortName,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.darkGrey,
                ),
              ),
            ],
          ).onlyPadding(left: 16),
          const Spacer(),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                border: Border.all(color: AppColors.primaryBlue, width: 5)),
          )
        ],
      ),
    );
  }
}  
