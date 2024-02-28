import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';

class QRWidget extends StatelessWidget {
  const QRWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 274,
          margin: const EdgeInsets.only(top: 14,bottom: 14),
          padding: const EdgeInsets.symmetric(horizontal: 66, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Image.asset("assets/images/QR.png"),
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: AppColors.white,
        )
      ],
    );
  }
}
