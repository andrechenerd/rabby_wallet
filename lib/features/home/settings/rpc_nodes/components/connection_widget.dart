// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/range_button.dart';

class ConnectionWidget extends StatelessWidget {
  const ConnectionWidget({
    Key? key,
    required this.link,
    required this.ms,
    required this.height,
    required this.isSelected,
  }) : super(key: key);
  final String link;
  final int ms;
  final int height;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              link,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color:
                    isSelected ? AppColors.primaryBlue : AppColors.primaryGrey,
              ),
            ).onlyPadding(bottom: 4),
            Row(
              children: [
                _buildMs(),
                if (ms < 999) ...[
                  Container(
                    width: 1,
                    height: 16,
                    color: AppColors.lightBlue,
                  ).symmetricPadding(horizontal: 8),
                  Text(
                    "Height: $height",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryBlue,
                    ),
                  )
                ],
              ],
            )
          ],
        ).expanded(),
        if (isSelected) const RangeButton(isSelected: true).onlyPadding(left: 16),
      ],
    );
  }

  Widget _buildMs() {
    Color color = ms < 700 ? AppColors.lightGreen : AppColors.lightRed;
    final text = ms > 999 ? "Not Available" : "${ms}ms";
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ).onlyPadding(right: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ],
    );
  }
}
