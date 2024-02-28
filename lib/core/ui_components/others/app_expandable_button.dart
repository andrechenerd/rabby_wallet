// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';

class AppExpandableButton extends StatelessWidget {
  const AppExpandableButton({
    Key? key,
    required this.bgColor,
    required this.contentColor,
    required this.text,
    this.onTap,
    this.icon,
  }) : super(key: key);
  final VoidCallback? onTap;
  final Color bgColor;
  final Color contentColor;
  final String text;
  final String? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Image.asset(
                icon!,
                height: 20,
                color: contentColor,
              ).onlyPadding(right: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: contentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
