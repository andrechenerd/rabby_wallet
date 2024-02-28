import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';
import 'package:rabby_wallet/core/ui_components/others/app_textfield.dart';
import 'package:rabby_wallet/features/home/settings/components/app_bar.dart';
import 'package:rabby_wallet/features/send_to_address/cubit.dart';
import 'package:rabby_wallet/features/send_to_address/state.dart';

import '../../app/navigation/app_navigator.dart';
import '../../app/navigation/routes.dart';

class SendToAddressScreenBuilder extends StatelessWidget {
  const SendToAddressScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SendToAddressCubit(),
        child: const SendToAddressScreen());
  }
}

class SendToAddressScreen extends StatefulWidget {
  const SendToAddressScreen({super.key});

  @override
  State<SendToAddressScreen> createState() => _SendToAddressScreenState();
}

class _SendToAddressScreenState extends State<SendToAddressScreen> {
  SendToAddressCubit cubit = SendToAddressCubit();
  TextEditingController ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: BlocBuilder<SendToAddressCubit, SendToAddressState>(
          bloc: cubit,
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.darkScaffoldBC,
              body: Column(
                children: [
                  const SettingsAppBar(
                    text: "Send to address",
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
                                  hintText: "Enter address",
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
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppIcons.check,
                              height: 20,
                            ),
                            const Text(
                              "Check the address you have copied",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.darkGrey,
                              ),
                            ).onlyPadding(left: 8),
                          ],
                        ).onlyPadding(bottom: 10),
                        AppButton(
                          text: "Preview transaction",
                          onTap: () {
                            if (state.isActive) {
                              context.read<AppNavigator>().pushNamed(
                                    routeName: Routes.transaction,
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
}
