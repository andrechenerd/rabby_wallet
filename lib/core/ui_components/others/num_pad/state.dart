import 'package:equatable/equatable.dart';
import 'package:rabby_wallet/core/ui_components/others/num_pad/models/button_data.dart';

class NumPadWidgetState extends Equatable {
  final List<ButtonData> buttonsData;
  const NumPadWidgetState({
    required this.buttonsData,
  });

  NumPadWidgetState copyWith({
    List<ButtonData>? buttonsData,
  }) {
    return NumPadWidgetState(
      buttonsData: buttonsData ?? this.buttonsData,
    );
  }

  @override
  List<Object> get props => [buttonsData];

}
