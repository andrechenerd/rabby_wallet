import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/app/navigation/app_navigator.dart';
import 'package:rabby_wallet/app/navigation/routes.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';
import 'package:rabby_wallet/core/ui_components/others/app_textfield.dart';


class AddContactScreenBuilder extends StatelessWidget {
  const AddContactScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddContactScreen();
  }
}

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  TextEditingController ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.primaryBlue,
              child: Column(
                children: [
                  const Text(
                    "Add Contact",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ).onlyPadding(top: 45, bottom: 13),
                  const Text(
                    "You can also use as a wath-only adress",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  AppTextField(
                    controller: ctrl,
                    hintText: "favhbbfovbovfbgu",
                    fillColor: AppColors.secondaryWhite,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        height: 40,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppIcons.scan,
                              height: 24,
                            ).onlyPadding(right: 6),
                            const Text(
                              "Scan QR",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                          ],
                        )),
                  ),
                  const Spacer(),
                  AppButton(
                    text: "Confirm",
                    onTap: () {
                      context
                          .read<AppNavigator>()
                          .pushNamed(routeName: Routes.passCode, args: {
                        "title": "Set Passcode",
                        "subtitle":
                            "It will be used to unlock your wallet and encrypt local data",
                        "onComplete": (dd) {},
                      });
                    },
                    horizontalMargin: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
