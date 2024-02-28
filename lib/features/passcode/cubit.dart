import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/features/passcode/state.dart';

class PassCodeScreenCubit extends Cubit<PassCodeScreenState> {
  PassCodeScreenCubit() : super(PassCodeScreenState.initial());

  void setCode(String code) {
    emit(state.copyWith(code: code));
  }
}
