import 'package:equatable/equatable.dart';

import '../../data/models/transaction.dart';

class HomeScreenState extends Equatable {
  final int selectedTab;
     final List<Transaction>  transactions;
  const HomeScreenState({
    required this.selectedTab,
    required this.transactions,

  });

  HomeScreenState copyWith({
    int? selectedTab,
   List<Transaction> ? transactions,

  }) {
    return HomeScreenState(
      selectedTab: selectedTab ?? this.selectedTab,
      transactions: transactions ?? this.transactions,

    );
  }

  @override
  List<Object> get props => [selectedTab,transactions];


  factory HomeScreenState.initial(){
    return const HomeScreenState(selectedTab: 0,transactions: [],);
  }
}
