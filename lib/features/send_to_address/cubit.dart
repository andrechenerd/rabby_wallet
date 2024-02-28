import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/features/send_to_address/state.dart';

class SendToAddressCubit extends Cubit<SendToAddressState> {
  SendToAddressCubit() : super(SendToAddressState.initial());

  void onCheckAvtiity(String query) {
    emit(state.copyWith(
      isActive: query.isNotEmpty ? true : false,
    ));
  }
}
