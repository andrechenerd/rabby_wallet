import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';

class CryptoDropdown extends StatelessWidget {
  final String imagePath;
  final String name;
  final double count;
  final double price;
  final VoidCallback onTap;
  const CryptoDropdown({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.count,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 40,
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style:
                      const TextStyle(fontSize: 16, color: AppColors.primaryGrey),
                ),
                const Spacer(),
                Text(
                  count.toString(),
                  style: const TextStyle(fontSize: 14, color: AppColors.darkGrey),
                ),
              ],
            ).onlyPadding(left: 16),
            const Spacer(),
            Text(
              "\$${price.toString()}",
              style: const TextStyle(fontSize: 16, color: AppColors.primaryGrey),
            ),
            Transform.rotate(
              angle: 90 * (3.14159265358979323846 / 180),
              child: Image.asset(
                AppIcons.arrowRigth,
                color: AppColors.primaryGrey,
                height: 24,
              ),
            ).symmetricPadding(horizontal: 12)
          ],
        ),
      ),
    );
  }
}
