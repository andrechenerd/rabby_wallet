import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class SendToBox extends StatelessWidget {
  final String address;
  const SendToBox({super.key, required this.address,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Send to",
            style: TextStyle(
              fontSize: 12,
              color: AppColors.darkGrey,
            ),
          ),
          Text(
            address,
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
