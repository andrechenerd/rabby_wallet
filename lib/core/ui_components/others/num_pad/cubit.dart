import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/core/ui_components/others/num_pad/state.dart';

import '../../../constants/app_icons.dart';
import 'models/button_data.dart';

List<ButtonData> _initialButtonsState = [
  NumberButton(number: "1"),
  NumberButton(number: "2"),
  NumberButton(number: "3"),
  NumberButton(number: "4"),
  NumberButton(number: "5"),
  NumberButton(number: "6"),
  NumberButton(number: "7"),
  NumberButton(number: "8"),
  NumberButton(number: "9"),
  AssetClearButton(assetPath: AppIcons.clear),
  NumberButton(number: "0"),
  AssetConfirmButton(assetPath: AppIcons.forward),
];

class NumPadWidgetCubit extends Cubit<NumPadWidgetState> {
  NumPadWidgetCubit(this.maxLength)
      : super(NumPadWidgetState(buttonsData: _initialButtonsState));
  String _text = "";
  final int maxLength;
  bool _isLoading = false;
  void onButtonTap({
    required ButtonData data,
    required int index,
    required void Function(String) onChanged,
    required VoidCallback onSubmit,
  }) async {
    if (_isLoading) return;
    _isLoading = true;

    List<ButtonData> copy = List<ButtonData>.from(state.buttonsData);
    copy[index] = (copy[index] as ChangableButton).copyWith(isSelected: true);
    emit(state.copyWith(buttonsData: copy));
    await Future.delayed(const Duration(milliseconds: 150));
    if (_text.isEmpty && data is! NumberButton) {
      // do nothing
    } else if (data is AssetClearButton) {
      final end = _text.length - 1;
      final newText = _text.substring(0, end < 0 ? null : end);
      _text = newText;
      onChanged(newText);
    } else if (data is AssetConfirmButton) {
      onSubmit();
    } else if (_text.length < maxLength) {
      final newText = "$_text${data.data}";
      _text = newText;
      onChanged(newText);
    }
    await Future.delayed(const Duration(milliseconds: 150));
    List<ButtonData> newCopy = List<ButtonData>.from(state.buttonsData);
    newCopy[index] =
        (newCopy[index] as ChangableButton).copyWith(isSelected: false);
    emit(state.copyWith(buttonsData: newCopy));
    _isLoading = false;
  }
}
