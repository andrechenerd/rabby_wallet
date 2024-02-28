// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_textfield.dart';

class SwapWidget extends StatelessWidget {
  const SwapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 0,
                color: Color.fromRGBO(0, 0, 0, 0.08),
              ),
            ],
          ),
          child: Row(
            children: [
              CryptoWidget(
                onTap: () {},
                ctrl: TextEditingController(),
                title: "Pay with",
                balance: 70,
                countedMoney: 84541,
                image: AppIcons.etherium,
                name: "Etherium",
                symbol: "ETH",
              ).expanded(),
              const SizedBox(width: 15,),
              CryptoWidget(
                onTap: () {},
                ctrl: TextEditingController(),
                title: "Receive",
                balance: 70,
                countedMoney: 84541,
                image: AppIcons.etherium,
                name: "Etherium",
                symbol: "ETH",
              ).expanded(),
            ],
          ),
        ).onlyPadding(top: 26),
        Container(
          width: 64,
          height: 64,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 0,
                color: Color.fromRGBO(0, 0, 0, 0.08),
              ),
            ],
          ),
          child: Image.asset(
            AppIcons.swap,
            width: 32,
            height: 32,
          ),
        )
      ],
    );
  }
}

class CryptoWidget extends StatelessWidget {
  const CryptoWidget({
    Key? key,
    required this.onTap,
    this.image,
    this.name,
    this.symbol,
    required this.ctrl,
    this.countedMoney,
    required this.title,
    this.balance,
  }) : super(key: key);
  final VoidCallback onTap;
  final String? image;
  final String? name;
  final String? symbol;
  final TextEditingController ctrl;
  final double? countedMoney;
  final String title;
  final int? balance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryBlue,
          ),
        ).onlyPadding(bottom: 8),
        Container(
          constraints: const BoxConstraints(minHeight: 136),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            color: AppColors.lightBgColor,
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 0,
                color: Color.fromRGBO(0, 0, 0, 0.08),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                color: AppColors.transparent,
                child: Row(
                  children: [
                    _buildAvatarBlock().onlyPadding(right: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name ?? "Select Token",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightBlack,
                          ),
                        ),
                        if (symbol != null)
                          Text(
                            symbol!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkGrey,
                            ),
                          ),
                      ],
                    ).expanded(),
                  ],
                ),
              ),
              AppTextField(
                controller: ctrl,
                hintText: '0',
                minMaxHeight: 36,
                fillColor: AppColors.lightGrey.withOpacity(.12),
                borderColor: AppColors.borderColor,
              ).onlyPadding(top: 8),
              if (countedMoney != null)
                Text(
                  "\$$countedMoney",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrey,
                  ),
                ),
            ],
          ),
        ).onlyPadding(bottom: 10),
        Text(
          balance == null ? "" : "Balance: $balance",
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.darkGrey,
          ),
        ),
      ],
    );
  }

  Widget _buildAvatarBlock() {
    if (image == null) {
      return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: AppColors.lightestBlue,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.lightBlue)),
      );
    }
    return Image.asset(
      image!,
      width: 40,
      height: 40,
    );
  }
}
