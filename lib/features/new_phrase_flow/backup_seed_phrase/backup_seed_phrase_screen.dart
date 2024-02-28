import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/app/navigation/routes.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';
import 'package:rabby_wallet/data/repositories/wallet_repo.dart';
import 'package:rabby_wallet/features/home/settings/components/app_bar.dart';
import 'package:rabby_wallet/features/new_phrase_flow/backup_seed_phrase/cubit.dart';
import 'package:rabby_wallet/features/new_phrase_flow/backup_seed_phrase/state.dart';
import '../../../app/navigation/app_navigator.dart';
import '../../../core/ui_components/others/app_expandable_button.dart';
import 'components/seed_phrase.dart';

class BackUpSeedPhraseScreenBuilder extends StatelessWidget {
  const BackUpSeedPhraseScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BackupSeedPhraseCubit(),
        child: const BackUpSeedPhraseScreen());
  }
}

class BackUpSeedPhraseScreen extends StatefulWidget {
  const BackUpSeedPhraseScreen({super.key});

  @override
  State<BackUpSeedPhraseScreen> createState() => _BackUpSeedPhraseScreenState();
}

class _BackUpSeedPhraseScreenState extends State<BackUpSeedPhraseScreen> {
  BackupSeedPhraseCubit cubit = BackupSeedPhraseCubit();
  late WalletRepo _walletRepo;
  @override
  void initState() {
    cubit.initWallet();
    _walletRepo = WalletRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocBuilder<BackupSeedPhraseCubit, BackupSeedPhraseState>(
          bloc: cubit,
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryBlue,
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.only(top: 40, bottom: 40),
                      children: [
                        const SettingsAppBar(
                          text: "Backup Seed Phrase",
                        ),
                        GridView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: state.menmonicPhrases.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 20,
                                    crossAxisCount: 2,
                                    mainAxisExtent: 50,
                                    mainAxisSpacing: 10),
                            itemBuilder: (_, index) {
                              return SeedPhraseItem(
                                  index: index + 1,
                                  phrase: state.isShown
                                      ? state.menmonicPhrases[index]
                                      : "•••••");
                            }).symmetricPadding(vertical: 40),
                        Row(
                          children: [
                            AppExpandableButton(
                              icon: AppIcons.showKey,
                              bgColor: AppColors.lightBlue,
                              contentColor: AppColors.primaryBlue,
                              text: "Show key",
                              onTap: () {
                                cubit.toShow();
                              },
                            ).expanded(),
                            const SizedBox(
                              width: 15,
                            ),
                            AppExpandableButton(
                              icon: AppIcons.copy,
                              bgColor: AppColors.white,
                              contentColor: AppColors.primaryGrey,
                              text: "Copy",
                              onTap: () async {
                                await Clipboard.setData(ClipboardData(
                                    text: _walletRepo
                                        .lastWallet!.menmonicPhrase));
                              },
                            ).expanded(),
                          ],
                        ).onlyPadding(
                          bottom: 36,
                        ),
                        const Text(
                          'Make sure no one else is watching your screen when you back up the seed phrase',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightRed,
                          ),
                        ).onlyPadding(bottom: 40),
                        AppButton(
                            text: "I’ve Saved the Phrase",
                            onTap: () {
                              context.read<AppNavigator>().pushNamed(
                                    routeName: Routes.createdSuccessfully,
                                  );
                            }),
                      ],
                    ).onlyPadding(left: 16, right: 16),
            );
          }),
    ));
  }
}
