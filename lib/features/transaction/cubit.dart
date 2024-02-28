import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/features/transaction/state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionState.initial());

  void changeToFast() {
    emit(state.copyWith(selectedTab: 0));
  }

  void changeToStandart() {
    emit(state.copyWith(selectedTab: 1));
  }
}
