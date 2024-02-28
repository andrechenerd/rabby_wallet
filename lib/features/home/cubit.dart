import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/features/home/state.dart';

import '../../data/repositories/wallet_repo.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenState.initial());

  void changeToActivity() {
    if (state.selectedTab != 1) {
      emit(state.copyWith(selectedTab: 1));
    }
  }

  void changeToWallet() {
    if (state.selectedTab != 0) {
      emit(state.copyWith(selectedTab: 0));
    }
  }
            

                final _walletWallet = WalletRepo();


    void getTransactions(){
      emit(state.copyWith(transactions: _walletWallet.lastWallet!.transactions));
    }

    void clearTransactionHistory(){
      emit(state.copyWith(transactions: []));
      print(state.transactions);
    }

}
