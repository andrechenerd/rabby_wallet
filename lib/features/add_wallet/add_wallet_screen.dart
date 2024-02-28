import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/bottomsheets/app_bottomsheet.dart';
import 'package:rabby_wallet/core/ui_components/bottomsheets/choose_crypto_bottomsheet.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';
import 'package:rabby_wallet/core/ui_components/others/app_textfield.dart';
import 'package:rabby_wallet/data/models/wallet.dart';
import 'package:rabby_wallet/features/add_wallet/cubit.dart';
import 'package:rabby_wallet/features/add_wallet/state.dart';
import 'package:rabby_wallet/features/home/settings/components/app_bar.dart';
import '../../app/navigation/app_navigator.dart';
import '../../app/navigation/routes.dart';
import '../../core/utils/hide_wallet_address.dart';
import '../../data/repositories/hive_repo.dart';
import '../../data/repositories/wallet_repo.dart';

class AddWalletScreenBuilder extends StatelessWidget {
  const AddWalletScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddWalletCubit(), child: const AddWalletScreen());
  }
}

class AddWalletScreen extends StatefulWidget {
  const AddWalletScreen({super.key});

  @override
  State<AddWalletScreen> createState() => _AddWalletScreenState();
}

class _AddWalletScreenState extends State<AddWalletScreen> {
  AddWalletCubit cubit = AddWalletCubit();
  TextEditingController ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: BlocBuilder<AddWalletCubit, AddWalletState>(
          bloc: cubit,
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.darkScaffoldBC,
              body: Column(
                children: [
                  const SettingsAppBar(
                    text: "Add wallet",
                  ).onlyPadding(left: 16, top: 30, bottom: 40),
                  Expanded(
                      child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 8,
                                child: AppTextField(
                                  hintStyle: const TextStyle(
                                    color: AppColors.darkGrey,
                                    fontSize: 14,
                                  ),
                                  borderColor: AppColors.transparent,
                                  fillColor: AppColors.darkScaffoldBC,
                                  controller: ctrl,
                                  hintText: "Recovery phrase",
                                  onChanged: (query) =>
                                      cubit.onCheckAvtiity(query),
                                ).onlyPadding(top: 40, left: 16)),
                            Expanded(
                              child: Image.asset(
                                AppIcons.noteText,
                                height: 24,
                                color: AppColors.primaryBlue,
                              ).onlyPadding(top: 14),
                            ),
                          ],
                        ),
                        const Text(
                          "Enter or paste here the 12 or 24 words from your recovery phrase, private key.",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.darkGrey,
                          ),
                        ).symmetricPadding(horizontal: 16),
                        const Spacer(),
                        AppButton(
                          text: "Import",
                          onTap: () {
                            if (state.isActive) {
                              onImport().then(
                                (value) {
                                  if (value == null) return;
                                  showImportWalletBottomSheet(
                                    context,
                                    address: value.address,
                                    onImport: () {
                                      HiveRepo().saveMnemonic(ctrl.text.trim());
                                      showManageCryptoBottomSheet(context,
                                          onTap: () {
                                        showCongratilationsBottomSheet(context,
                                            address: value.address, onTap: () {
                                          HiveRepo().setIsNotFirstAppOpen();
                                          context
                                              .read<AppNavigator>()
                                              .pushNamedAndRemoveUntil(
                                                routeName: Routes.home,
                                              );
                                        });
                                      });
                                    },
                                  );
                                },
                              );
                            }
                          },
                          bgColor: state.isActive
                              ? AppColors.primaryBlue
                              : AppColors.darkGrey,
                        ).onlyPadding(
                          bottom: 40,
                        )
                      ],
                    ),
                  ))
                ],
              ),
            );
          }),
    ));
  }

  bool _isImportLoading = false;
  Future<Wallet?> onImport() async {
    if (_isImportLoading) return null;
    _isImportLoading = true;
    try {
      final wallet = await WalletRepo().importWallet(ctrl.text.trim());
      _isImportLoading = false;
      return wallet;
    } catch (e) {
      _isImportLoading = false;
      if (_isImportLoading) return null;
    }
    return null;
  }
}

Future<void> showImportWalletBottomSheet(
  BuildContext context, {
  required VoidCallback onImport,
  required String address,
}) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.transparent,
    elevation: 0,
    isScrollControlled: true,
    builder: (context) => AppBottomSheet(
      onTap: onImport,
      title: "Name your wallet",
      subTitle: hideWalletAddress(address),
    ),
  );
}

Future<void> showCongratilationsBottomSheet(
  BuildContext context, {
  required VoidCallback onTap,
  required String address,
}) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.transparent,
    elevation: 0,
    isScrollControlled: true,
    builder: (context) => AppBottomSheet(
      onTap: onTap,
      title: "Congratulations",
      subTitle:
          "You have successfully added a new wallet $address (Wallet Address)",
    ),
  );
}

Future<void> showManageCryptoBottomSheet(
  BuildContext context, {
  required VoidCallback onTap,
}) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.transparent,
    elevation: 0,
    isScrollControlled: true,
    builder: (context) => ChooseCryptoBottomsheet(
      onTap: onTap,
    ),
  );
}
