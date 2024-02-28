import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/features/add_wallet/state.dart';



class AddWalletCubit extends Cubit<AddWalletState> {
  AddWalletCubit() : super(AddWalletState.initial());


  void onCheckAvtiity(String query) {
    emit(state.copyWith(
      isActive: query.isNotEmpty ? true : false,
    ));
  }


}
