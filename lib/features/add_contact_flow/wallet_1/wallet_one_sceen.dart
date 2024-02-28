import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/constants/app_images.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';
import 'package:rabby_wallet/data/repositories/wallet_repo.dart';

import '../../../core/ui_components/others/small_but_with_icon.dart';
import 'components/balance_widget.dart';

class WalletOneScreenBuilder extends StatelessWidget {
  const WalletOneScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const WalletOneScreen();
  }
}

class WalletOneScreen extends StatefulWidget {
  const WalletOneScreen({super.key});

  @override
  State<WalletOneScreen> createState() => _WalletOneScreenState();
}

class _WalletOneScreenState extends State<WalletOneScreen> {

  late WalletRepo _walletRepo;

  @override
  void initState() {
    _walletRepo = WalletRepo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 32,
                width: 32,
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Image.asset(
                  AppImages.rabbitLogo,
                  color: AppColors.primaryBlue,
                ),
              ),
              const Text(
                "Wallets 1",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ).onlyPadding(
                left: 16,
              ),
            ],
          ).onlyPadding(
            top: 40,
            left: 20,
            bottom: 40,
          ),
           BalanceWidget(
            balance: _walletRepo.lastWallet!.countedMoneyInDollars,
            address: _walletRepo.lastWallet!.address,
          ),
          Row(
            children: [
              SmallButtonWithIcon(
                iconPath: AppIcons.wallet,
                title: "Send",
                onTap: () {},
              ),
              const SizedBox(
                width: 10,
              ),
              SmallButtonWithIcon(
                iconPath: AppIcons.forward,
                title: "Send",
                onTap: () {},
              ),
            ],
          ).onlyPadding(top: 40, left: 20, right: 20),
          const Spacer(),
          AppButton(
            text: "Done",
            onTap: () {},
            bgColor: AppColors.white,
            textColor: AppColors.primaryBlue,
          ).onlyPadding(bottom: 40),
        ],
      ),
    ));
  }
}
