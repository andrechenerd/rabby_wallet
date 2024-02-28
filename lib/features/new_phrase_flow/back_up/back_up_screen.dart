import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';
import 'package:rabby_wallet/data/repositories/hive_repo.dart';

import '../../../app/navigation/app_navigator.dart';
import '../../../app/navigation/routes.dart';

class BackUpScreenBuilder extends StatelessWidget {
  const BackUpScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackUpScreen();
  }
}

class BackUpScreen extends StatefulWidget {
  const BackUpScreen({super.key});

  @override
  State<BackUpScreen> createState() => _BackUpScreenState();
}

class _BackUpScreenState extends State<BackUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const Text(
            "BACK UP YOUR Seed Phrase\n24 words - 12 words!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryBlue,
            ),
          ),
          const Text(
            "Here's your Secret Key: 24 words that give you access to your new wallet.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryGrey,
            ),
          ).onlyPadding(top: 32, bottom: 16),
          const Text(
            "You'll need it to access your wallet on a new device, or this one if you lose your password - so back it up somewhere safe!",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryGrey,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.darkGrey, // Shadow color
                  spreadRadius: 0.5, // Spread radius
                  blurRadius: 1, // Blur radius
                  offset: Offset(2, 1), // Offset
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Secret Key gives access to your wallet",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const Text(
                  "Never share your Secret Key with anyone",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryBlue,
                  ),
                ).symmetricPadding(vertical: 16),
                const Text(
                  "A Store it somewhere 100% private and secure",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          AppButton(
            text: "Show Seed Phrase",
            onTap: onShowSeedPhrase,
            horizontalMargin: 0,
          )
        ],
      ).onlyPadding(
        left: 16,
        right: 16,
        top: 30,
        bottom: 40,
      ),
    ));
  }

  void onShowSeedPhrase() {
    final navigator = context.read<AppNavigator>();
    void onPinCreate(String pin) {
      void onPinConfirm(String confirmPin) {
        if (pin == confirmPin) {
          HiveRepo().setPinCode(confirmPin);
          navigator.pushNamedAndRemoveUntil(routeName: Routes.backupSeedPhrase);
        }
      }

      navigator.pushNamed(
        routeName: Routes.passCode,
        args: {
          "title": "Confirm Passcode",
          "onComplete": onPinConfirm,
        },
      );
    }

    navigator.pushNamed(
      routeName: Routes.passCode,
      args: {
        "title": "Set Passcode",
        "subtitle": "It will be used to unlock your wallet and encrypt local data",
        "onComplete": onPinCreate,
      },
    );
  }
}
