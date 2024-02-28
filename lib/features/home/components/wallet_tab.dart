import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/data/models/activity.dart';

import '../../../app/navigation/app_navigator.dart';
import '../../../app/navigation/routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/ui_components/others/app_expandable_button.dart';
import '../../add_contact_flow/wallet_1/components/balance_widget.dart';
import 'crypto_box.dart';

class WalletTab extends StatelessWidget {
  final double balance;
  final String address;
  final List<Activity> activities;
  const WalletTab({super.key, required this.balance, required this.address, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         BalanceWidget(
          address: address,
          balance: balance,
          withProcent: true,
        ),
        Row(
          children: [
            AppExpandableButton(
              icon: AppIcons.wallet,
              bgColor: AppColors.white,
              contentColor: AppColors.primaryGrey,
              text: "Send",
              onTap: () {
                context.read<AppNavigator>().pushNamed(
                      routeName: Routes.sendToAddress,
                    );
              },
            ).expanded(),
            const SizedBox(
              width: 15,
            ),
            AppExpandableButton(
              icon: AppIcons.forward,
              bgColor: AppColors.white,
              contentColor: AppColors.primaryGrey,
              text: "Recieve",
              onTap: () {
                context.read<AppNavigator>().pushNamed(
                      routeName: Routes.receive,
                    );
              },
            ).expanded(),
            
          ],
        ).onlyPadding(
          bottom: 39,
          left: 16,
          right: 16,
          top: 24,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: const Text(
            "Crypto portfolio",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryGrey,
            ),
          ).onlyPadding(
            left: 16,
            bottom: 26,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(1, 2),
                  blurRadius: 3,
                  color: AppColors.lightBlue,
                )
              ]),
          child:  Column(
            children: [

              ...List.generate(activities.length, (index) => 
              
                      CryptoBox(
                cryptoName: activities[index].cryptoName,
                price: activities[index].value,
                priceDollar: activities[index].cryptoPriceInDollars,
                imagePath:  activities[index].cryptoSymbol,
                procent: 23,
              ),
              
              
              )
      
              // CryptoBox(
              //   cryptoName: "Ethereum",
              //   price: 6.048,
              //   priceDollar: 29,
              //   imagePath: "assets/images/Tocen (1).png",
              //   procent: 13.39,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
