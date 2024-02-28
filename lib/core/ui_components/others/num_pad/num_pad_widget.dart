// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/num_pad/state.dart';

import '../../../constants/app_colors.dart';
import 'cubit.dart';
import 'models/button_data.dart';

class NumPadWidget extends StatefulWidget {
  const NumPadWidget({
    Key? key,
    this.maxLength = 6,
    required this.onChanged,
    required this.onSubmit,
  }) : super(key: key);
  final int maxLength;
  final void Function(String) onChanged;
  final VoidCallback onSubmit;
  @override
  State<NumPadWidget> createState() => _NumPadWidgetState();
}

class _NumPadWidgetState extends State<NumPadWidget> {
  late final NumPadWidgetCubit cubit;

  @override
  void initState() {
    cubit = NumPadWidgetCubit(widget.maxLength);
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 300,
      child: BlocBuilder<NumPadWidgetCubit, NumPadWidgetState>(
          bloc: cubit,
          builder: (context, state) {
            return GridView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: state.buttonsData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisExtent: 50, mainAxisSpacing: 32),
              itemBuilder: (_, index) {
                final data = state.buttonsData[index];
                return GestureDetector(
                  onTap: () {
                    cubit.onButtonTap(
                      data: data,
                      index: index,
                      onChanged: widget.onChanged,
                      onSubmit: widget.onSubmit,
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: data is NumberButton
                            ? data.isSelected
                                ? AppColors.transparent
                                : AppColors.primaryGrey
                            : AppColors.transparent,
                      ),
                      color: data.isSelected
                          ? AppColors.primaryBlue
                          : data is NumberButton
                              ? AppColors.transparent
                              : data is AssetClearButton
                                  ? AppColors.darkGrey
                                  : AppColors.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: data is NumberButton
                          ? AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              style: TextStyle(
                                color: data.isSelected
                                    ? AppColors.white
                                    : AppColors.primaryGrey,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                              child: Text(data.data),
                            )
                          : Image.asset(
                              data.data,
                              width: 22,
                              color: AppColors.white,
                            ),
                    ),
                  ),
                );
              },
            ).symmetricPadding(horizontal: 30);
          }),
    );
  }
}
