import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_images.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';
import 'package:rabby_wallet/data/repositories/hive_repo.dart';
import 'package:rabby_wallet/data/repositories/wallet_repo.dart';
import 'package:rabby_wallet/features/new_phrase_flow/created_successfully/components/phrase_box.dart';

import '../../../app/navigation/app_navigator.dart';
import '../../../app/navigation/routes.dart';

class CreatedSuccessfullyScreenBuilder extends StatelessWidget {
  const CreatedSuccessfullyScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreatedSuccessfullyScreen();
  }
}

class CreatedSuccessfullyScreen extends StatefulWidget {
  const CreatedSuccessfullyScreen({super.key});

  @override
  State<CreatedSuccessfullyScreen> createState() => _CreatedSuccessfullyScreenState();
}

class _CreatedSuccessfullyScreenState extends State<CreatedSuccessfullyScreen> {
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset(
              AppImages.createSuccessfully,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Column(
              children: [
                const Text(
                  "Created Successfully",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ).onlyPadding(top: 30, bottom: 27),
                 PhraseBoxWidget(address: _walletRepo.lastWallet!.address,),
                const Spacer(),
                AppButton(
                  text: "Done",
                  onTap: () {
                    HiveRepo().setIsNotFirstAppOpen();
                    context.read<AppNavigator>().pushNamed(
                          routeName: Routes.home,
                        );
                  },
                  bgColor: AppColors.white,
                  textColor: AppColors.primaryBlue,
                ).onlyPadding(bottom: 40)
              ],
            )
          ],
        ),
      ),
    ));
  }
}
