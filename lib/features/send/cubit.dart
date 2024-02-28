import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/features/send/state.dart';

class SendCubit extends Cubit<SendState> {
  SendCubit() : super(SendState.initial());

  void onExchange(double query) {
    emit(state.copyWith(exchange: query * state.exchange));
  }
}
