import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_images.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/features/passcode/cubit.dart';
import 'package:rabby_wallet/features/passcode/state.dart';

import '../../core/ui_components/others/num_pad/num_pad_widget.dart';

class PassCodeScreenBuilder extends StatelessWidget {
  const PassCodeScreenBuilder({
    Key? key,
    required this.title,
    this.subtitle,
    required this.onComplete,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final void Function(String) onComplete;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PassCodeScreenCubit(),
      child: PassCodeScreen(
        title: title,
        onComplete: onComplete,
        subtitle: subtitle,
      ),
    );
  }
}

class PassCodeScreen extends StatefulWidget {
  const PassCodeScreen({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onComplete,
  }) : super(key: key);
  final String title;
  final String? subtitle;
  final void Function(String) onComplete;
  @override
  State<PassCodeScreen> createState() => _PassCodeScreenState();
}

class _PassCodeScreenState extends State<PassCodeScreen> {
  late final PassCodeScreenCubit cubit;
  @override
  void initState() {
    cubit = context.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              AppImages.rabbitLogo,
              color: AppColors.primaryBlue,
              width: 96,
            ),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryBlue,
              ),
            ).onlyPadding(top: 30).symmetricPadding(horizontal: 20),
            if (widget.subtitle != null)
              Text(
                widget.subtitle!,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: AppColors.darkGrey),
                textAlign: TextAlign.center,
              ).onlyPadding(top: 15).symmetricPadding(horizontal: 20),
            const Spacer(),
            BlocBuilder<PassCodeScreenCubit, PassCodeScreenState>(
                builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  6,
                  (index) => Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: index < state.codeLength
                            ? AppColors.primaryBlue
                            : AppColors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primaryBlue)),
                  ),
                ),
              );
            }),
            const Spacer(),
            NumPadWidget(
              onChanged: (code) {
                cubit.setCode(code);
              },
              onSubmit: () {
                final code = cubit.state.code;
                if (code.length < 6) return;
                widget.onComplete(code);
              },
            ).onlyPadding(bottom: 40),
          ],
        ),
      ),
    );
  }
}
