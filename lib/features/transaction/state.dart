// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TransactionState extends Equatable {
  final int selectedTab;
 const TransactionState({
    required this.selectedTab,
  });
  
  @override
  List<Object> get props => [selectedTab];

  TransactionState copyWith({
    int? selectedTab,
  }) {
    return TransactionState(
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

  factory TransactionState.initial(){
    return const TransactionState(selectedTab: 0);
  }
}
