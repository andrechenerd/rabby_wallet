import 'package:equatable/equatable.dart';

class SendToAddressState extends Equatable {
  final bool isActive;
  const SendToAddressState({
    required this.isActive,
  });

  SendToAddressState copyWith({
    bool? isActive,
  }) {
    return SendToAddressState(
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object> get props => [isActive];


  factory SendToAddressState.initial(){
    return const SendToAddressState(isActive: false);
  }
}
