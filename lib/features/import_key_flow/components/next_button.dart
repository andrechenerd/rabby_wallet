import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String iconPath;
  final String title;
  const NextButton({
    super.key,
    required this.onTap,
    required this.iconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.secondaryWhite,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              height: 23,
            ),
            const SizedBox(
              width: 16,
            ),

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryGrey,
                    ),
                  ),
            
          ],
        ),
      ),
    );
    
  }
}
