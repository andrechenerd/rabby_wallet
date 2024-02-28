import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/features/home/settings/default_currency/state.dart';

import '../../../../data/repositories/exchange_rates_repo.dart';
import '../../../../data/repositories/hive_repo.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit()
      : super(
          CurrencyState.initial(),
        );

  final _hiveRepo = HiveRepo();
  void selectCurrency(Currency currency) {
    emit(state.copyWith(
      selectedCurrency: currency,

    )); 
    _hiveRepo.saveCurrencyCode(state.selectedCurrency.symbol);
  }
}
