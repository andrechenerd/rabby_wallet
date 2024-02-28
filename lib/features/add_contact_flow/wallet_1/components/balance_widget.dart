import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/constants/app_images.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';

import '../../../../core/utils/hide_wallet_address.dart';

class BalanceWidget extends StatelessWidget {
  final double balance;
  final bool withProcent;
  final String address;
  const BalanceWidget({
    super.key,
    required this.balance,
    this.withProcent = false,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 201,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.secondaryBlue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My balance",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                balance.toString(),
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const Text(
                "USD",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ).onlyPadding(bottom: 3, left: 6),
            ],
          ).onlyPadding(top: 5),
          const Spacer(),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 91,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.transparent),
              ),
              Positioned(
                top: 0,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 80,
                  width: MediaQuery.of(context).size.width - 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryBlue),
                ),
              ),
              Positioned(
                top: 6,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 80,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.lightBlue),
                ),
              ),
              Positioned(
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 80,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.rabbitLogo,
                        color: AppColors.primaryBlue,
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Wallet 1",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryGrey),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                hideWalletAddress(address),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryGrey),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await Clipboard.setData(
                                      ClipboardData(text: address));
                                },
                                child: Image.asset(
                                  AppIcons.copy,
                                  height: 24,
                                ).onlyPadding(left: 5),
                              )
                            ],
                          ),
                        ],
                      ).onlyPadding(
                        left: 10,
                        top: 2,
                        bottom: 2,
                      ),
                      if (withProcent) const Spacer(),
                      if (withProcent)
                        Row(
                          children: [
                            const Text(
                              "+4,2%",
                              style: TextStyle(color: AppColors.primaryBlue),
                            ),
                            Image.asset(
                              AppIcons.arrowUp,
                              height: 6,
                            ).onlyPadding(left: 5)
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
