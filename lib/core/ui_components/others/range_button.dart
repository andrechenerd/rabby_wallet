// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:rabby_wallet/core/constants/app_colors.dart';

class RangeButton extends StatelessWidget {
  const RangeButton({
    Key? key,
    this.size = 20,
    this.onTap,
    required this.isSelected,
  }) : super(key: key);
  final double size;
  final VoidCallback? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primaryBlue : AppColors.lightBlue,
              ),
            ),
            if (isSelected)
              Container(
                width: size / 2,
                height: size / 2,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
              )
          ],
        ),
      ),
    );
  }
}
