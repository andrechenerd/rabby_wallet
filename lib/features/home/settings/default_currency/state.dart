import 'package:equatable/equatable.dart';
import 'package:rabby_wallet/data/repositories/exchange_rates_repo.dart';

class CurrencyState extends Equatable {
  final Currency selectedCurrency;

  const CurrencyState({required this.selectedCurrency});

  CurrencyState copyWith({
    Currency? selectedCurrency,
  
  }) {
    return CurrencyState(
      selectedCurrency: selectedCurrency ?? this.selectedCurrency,
    
    );
  }

  @override
  List<Object?> get props => [
        selectedCurrency,
      ];

  factory CurrencyState.initial() {
    return const CurrencyState(
      selectedCurrency: Currency(symbol: "USD", rate: 0.221),
    
    );
  }
}
