import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/bottomsheets/app_bottomsheet.dart';
import 'package:rabby_wallet/core/ui_components/bottomsheets/choose_crypto_bottomsheet.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';
import 'package:rabby_wallet/data/repositories/hive_repo.dart';
import 'package:rabby_wallet/features/send/components/crypto_dropdown.dart';
import 'package:rabby_wallet/features/send/cubit.dart';
import 'package:rabby_wallet/features/send/state.dart';
import '../../app/navigation/app_navigator.dart';
import '../../app/navigation/routes.dart';
import '../../core/constants/app_icons.dart';

class SendScreenBuilder extends StatelessWidget {
  const SendScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendCubit(),
      child: const SendScreen(),
    );
  }
}

class SendScreen extends StatefulWidget {
  const SendScreen({super.key});

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  SendCubit cubit = SendCubit();
  TextEditingController ctrl = TextEditingController(text: "1");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.darkScaffoldBC,
        body: BlocBuilder<SendCubit, SendState>(
            bloc: cubit,
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          AppIcons.arrowBack,
                          width: 20,
                          height: 20,
                          color: AppColors.primaryGrey,
                        ),
                      ),
                      const Text(
                        "Send",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryGrey,
                        ),
                      ).onlyPadding(left: 20),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Max",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryGrey,
                          ),
                        ).symmetricPadding(horizontal: 12, vertical: 8),
                      ),
                    ],
                  ).symmetricPadding(vertical: 10),
                  CryptoDropdown(
                    imagePath: "assets/images/btc.png",
                    price: 29,
                    count: 0,
                    name: "BNB",
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        context: context,
                        builder: (context) => ChooseCryptoBottomsheet(
                          onTap: () {
                            context
                                .read<AppNavigator>()
                                .pushNamedAndRemoveUntil(
                                  routeName: Routes.home,
                                );
                          },
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 40,
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryGrey,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              gapPadding: 0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              gapPadding: 0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              gapPadding: 0,
                            ),
                          ),
                          controller: ctrl,
                          keyboardType: TextInputType.number,
                          onChanged: (value) =>
                              cubit.onExchange(double.parse(ctrl.text)),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        "USD",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryGrey,
                        ),
                      ).onlyPadding(bottom: 5),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${state.exchange} BTC",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGrey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  AppButton(
                    text: "Send",
                    onTap: () {
                      context.read<AppNavigator>().pushNamed(
                        args: {
                          "title": "Confirm PIN code",
                          "onComplete": (String value) {
                            context
                                .read<AppNavigator>()
                                .pushNamed(routeName: Routes.home);
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              context: context,
                              builder: (context) => AppBottomSheet(
                                  title: "Your transaction has been sent.",
                                  subTitle: "",
                                  onTap: () {
                                    Navigator.pop(context);
                                  }),
                            );
                          },
                        },
                        routeName: Routes.passCode,
                      );
                    },
                    horizontalMargin: 0,
                  ),
                ],
              ).paddingLTRB(16, 30, 16, 40);
            }),
      ),
    );
  }
}
