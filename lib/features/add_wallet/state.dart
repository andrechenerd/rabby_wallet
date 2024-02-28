import 'package:equatable/equatable.dart';

class AddWalletState extends Equatable {
  final bool isActive;
  const AddWalletState({
    required this.isActive,
  });

  AddWalletState copyWith({
    bool? isActive,
  }) {
    return AddWalletState(
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object> get props => [isActive];


  factory AddWalletState.initial(){
    return const AddWalletState(isActive: false);
  }
}
