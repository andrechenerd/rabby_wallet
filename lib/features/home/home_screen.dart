import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/data/repositories/wallet_repo.dart';
import 'package:rabby_wallet/features/home/components/activity_tab.dart';
import 'package:rabby_wallet/features/home/components/wallet_tab.dart';
import 'package:rabby_wallet/features/home/cubit.dart';
import 'package:rabby_wallet/features/home/state.dart';

import '../../app/navigation/app_navigator.dart';
import '../../app/navigation/routes.dart';
import '../../core/ui_components/others/small_but_with_icon.dart';
import 'components/home_appbar.dart';

class HomeScreenBuilder extends StatelessWidget {
  const HomeScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeScreenCubit(), child: const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenCubit cubit = HomeScreenCubit();
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
      body: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          bloc: cubit,
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  HomeAppBar(
                    onSettingsTap: () {
                      context.read<AppNavigator>().pushNamed(
                            routeName: Routes.settings,
                          );
                    },
                    onDotsTap: () {
                      context.read<AppNavigator>().pushNamed(
                            routeName: Routes.addContact,
                          );
                    },
                  ),
                  Row(
                    children: [
                      SmallButtonWithIcon(
                        onTap: () {
                          cubit.changeToWallet();
                        },
                        title: "Wallet",
                        iconPath: AppIcons.www,
                        textColor: AppColors.primaryGrey,
                      ).onlyPadding(right: 8),
                      SmallButtonWithIcon(
                        onTap: () {
                          cubit.changeToActivity();
                        },
                        title: "Activity",
                        iconPath: AppIcons.www,
                        textColor: AppColors.primaryGrey,
                      ),
                    ],
                  ).symmetricPadding(vertical: 26, horizontal: 16),
                  state.selectedTab == 0
                      ? WalletTab(
                        activities: _walletRepo.lastWallet!.activities,
                        address: _walletRepo.lastWallet!.address,
                          balance:
                              _walletRepo.lastWallet!.countedMoneyInDollars)
                      : const ActivityTab()
                ],
              ),
            );
          }),
    ));
  }
}
