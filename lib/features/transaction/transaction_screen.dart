import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';
import 'package:rabby_wallet/features/home/settings/components/app_bar.dart';
import 'package:rabby_wallet/features/transaction/cubit.dart';
import 'package:rabby_wallet/features/transaction/state.dart';

import '../../app/navigation/app_navigator.dart';
import '../../app/navigation/routes.dart';
import '../../core/constants/app_icons.dart';
import '../../core/ui_components/others/small_but_with_icon.dart';
import 'components/reception_type.dart';
import 'components/send_to_box.dart';
import 'components/transaction_amount_box.dart';
import 'components/transaction_fee_box.dart';

class TransactionScreenBuilder extends StatelessWidget {
  const TransactionScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TransactionCubit(),
        child: const TransactionScreen());
  }
}

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  TransactionCubit cubit = TransactionCubit();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.darkScaffoldBC,
        body: BlocBuilder<TransactionCubit, TransactionState>(
            bloc: cubit,
            builder: (context, state) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
                    const SettingsAppBar(
                      text: "Transaction",
                    ),
                    Row(
                      children: [
                        SmallButtonWithIcon(
                          onTap: () {
                            cubit.changeToStandart();
                          },
                          title: "Fast",
                          iconPath: AppIcons.www,
                          textColor: state.selectedTab == 0
                              ? AppColors.primaryGrey
                              : AppColors.white,
                          color: state.selectedTab == 0
                              ? AppColors.white
                              : AppColors.primaryBlue,
                          imageColor: state.selectedTab == 0
                              ? AppColors.primaryBlue
                              : AppColors.white,
                        ).onlyPadding(right: 8),
                        SmallButtonWithIcon(
                          onTap: () {
                            cubit.changeToFast();
                          },
                          title: "Standart",
                          iconPath: AppIcons.www,
                          textColor: state.selectedTab == 1
                              ? AppColors.primaryGrey
                              : AppColors.white,
                          color: state.selectedTab == 1
                              ? AppColors.white
                              : AppColors.primaryBlue,
                          imageColor: state.selectedTab == 1
                              ? AppColors.primaryBlue
                              : AppColors.white,
                        ),
                      ],
                    ).onlyPadding(top: 22),
                    const TransactionAmountBox(
                      dollarPrice: 34,
                      cryptoPrice: 0.0044,
                    ).symmetricPadding(
                      vertical: 12,
                    ),
                    const SendToBox(
                      address: "0xDACa159F870Ba0DAba0708d8794c2Ec9d988f6B4",
                    ),
                    TransactionFeeBox(
                      price: state.selectedTab == 0 ? 0.34 : 0.17,
                    ).onlyPadding(
                      top: 12,
                      bottom: 12,
                    ),
                    ReceptionTypeBox(
                      isFast: state.selectedTab == 0 ? false : true,
                    ),
                    const Spacer(),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Rabby cannot recover any lost funds.",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.darkGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ).onlyPadding(top: 30),
                    AppButton(
                      text: "Confirm transaction",
                      onTap: () {
                        context.read<AppNavigator>().pushNamed(
                              routeName: Routes.send,
                            );
                      },
                      horizontalMargin: 0,
                    ).onlyPadding(top: 10,bottom: 40),
                  ],
                ).paddingLTRB(16, 30, 16, 0,),
              );
            }),
      ),
    );
  }
}
