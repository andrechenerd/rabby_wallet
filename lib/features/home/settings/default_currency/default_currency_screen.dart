import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/range_button.dart';
import 'package:rabby_wallet/data/repositories/exchange_rates_repo.dart';
import 'package:rabby_wallet/features/home/settings/components/app_bar.dart';
import 'package:rabby_wallet/features/home/settings/components/settings_item.dart';
import 'package:rabby_wallet/features/home/settings/default_currency/cubit.dart';
import 'package:rabby_wallet/features/home/settings/default_currency/state.dart';

class DefaultCurrencyScreen extends StatefulWidget {
  const DefaultCurrencyScreen({super.key});

  @override
  State<DefaultCurrencyScreen> createState() => _DefaultCurrencyScreenState();
}

class _DefaultCurrencyScreenState extends State<DefaultCurrencyScreen> {
  late ExchangeRatesRepo repo;
  CurrencyCubit cubit = CurrencyCubit();
  @override
  void initState() {
    repo = ExchangeRatesRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryWhite,
      body: BlocBuilder<CurrencyCubit, CurrencyState>(
          bloc: cubit,
          builder: (context, state) {
            return SafeArea(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    const SettingsAppBar().onlyPadding(top: 18),
                    ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppIcons.defaultCurrencyOutlined,
                              width: 24,
                            ).onlyPadding(right: 16),
                            const Text(
                              "Default Currency",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryGrey,
                              ),
                            )
                          ],
                        ).symmetricPadding(vertical: 14),
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...List.generate(
                                  repo.currencies.length,
                                  (index) => SettingsItem.dark(
                                        text: repo.currencies[index].symbol,
                                        rightWidget: RangeButton(
                                            isSelected:
                                                repo.currencies[index] ==
                                                    state.selectedCurrency),
                                        onTap: () {
                                          cubit.selectCurrency(
                                              repo.currencies[index]);
                                        },
                                      ).onlyPadding(bottom: 24)),
                              // SettingsItem.dark(
                              //   text: "BTC",
                              //   rightWidget: const RangeButton(isSelected: true),
                              // ).onlyPadding(bottom: 24),
                              // SettingsItem.dark(
                              //   text: "CNY",
                              //   rightWidget: const RangeButton(isSelected: false),
                              // ).onlyPadding(bottom: 24),
                              // SettingsItem.dark(
                              //   text: "JPY",
                              //   rightWidget: const RangeButton(isSelected: false),
                              // ).onlyPadding(bottom: 24),
                              // SettingsItem.dark(
                              //   text: "HKD",
                              //   rightWidget: const RangeButton(isSelected: false),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ).expanded(),
                  ],
                ).symmetricPadding(horizontal: 16),
              ),
            );
          }),
    );
  }
}
