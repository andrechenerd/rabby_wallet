import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';

class ButtonWithIcon extends StatelessWidget {
  final VoidCallback onTap;
  final String iconPath;
  final String title;
  final String? underTitle;
  const ButtonWithIcon({
    Key? key,
    required this.onTap,
    required this.iconPath,
    required this.title,
    this.underTitle="",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.primaryBlue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              height: 23,
            ),
            const SizedBox(width: 16,),
    
            Container(
              padding: EdgeInsets.only(top: underTitle != ""?20:30),
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.secondaryWhite,
                    ),
                  ),
                  if (underTitle != "")
                    SizedBox(
                      width: MediaQuery.of(context).size.width/2+30,
                      child: Text(
                        underTitle!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.lightBlue,
                        ),
                      ),
                    ).onlyPadding(top: 3),
                ],
              ),
            ),
            const Spacer(),
            const SizedBox(width: 16,),
            Image.asset(
              AppIcons.arrowRigth,
              height: 23,
            ),
          ],
        ),
      ),
    );
  }
}
