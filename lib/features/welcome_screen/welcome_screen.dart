import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/app/navigation/app_navigator.dart';
import 'package:rabby_wallet/app/navigation/routes.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/constants/app_images.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import '../../core/ui_components/others/button_wiith_icon.dart';

class WelcomeScreenBuilder extends StatelessWidget {
  const WelcomeScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const WelcomeScreen();
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.backGround),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Let's get you started!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ).onlyPadding(top: 90, bottom: 10),
                Image.asset(
                  AppImages.rabbitLogo2,
                  height: 134,
                ).onlyPadding(bottom: 4),
                ButtonWithIcon(
                  onTap: () {
                    context.read<AppNavigator>().pushNamed(
                          routeName: Routes.backup,
                        );
                  },
                  iconPath: AppIcons.addSquare,
                  title: "Create New Seed Phrase",
                ).onlyPadding(bottom: 8),
                ButtonWithIcon(
                  onTap: () {
                    context.read<AppNavigator>().pushNamed(
                          routeName: Routes.addWallet,
                        );
                  },
                  iconPath: AppIcons.shop,
                  title: "Import Seed Phrase",
                ).onlyPadding(bottom: 8),
                ButtonWithIcon(
                  onTap: () {
                    context.read<AppNavigator>().pushNamed(
                          routeName: Routes.addContact,
                        );
                  },
                  iconPath: AppIcons.key,
                  title: "Import Private Key",
                ).onlyPadding(bottom: 8),
                ButtonWithIcon(
                  onTap: () {
                    context.read<AppNavigator>().pushNamed(
                          routeName: Routes.addContact,
                        );
                  },
                  iconPath: AppIcons.coffee,
                  title: "Add Contacts",
                  underTitle: "You can also use it as a watch-only address",
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'By proceeding, you agree to App\'s Name ',
                        style: TextStyle(
                          color: AppColors.primaryGrey,
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          height: 1.33,
                        ),
                      ),
                      TextSpan(
                        text: '\nTerms of Use',
                        style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          height: 1.33,
                        ),
                      ),
                    ],
                  ),
                ).onlyPadding(top: 30),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
