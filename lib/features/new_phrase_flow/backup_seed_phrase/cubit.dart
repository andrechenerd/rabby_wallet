import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/data/repositories/wallet_repo.dart';
import 'package:rabby_wallet/features/new_phrase_flow/backup_seed_phrase/state.dart';

class BackupSeedPhraseCubit extends Cubit<BackupSeedPhraseState> {
  BackupSeedPhraseCubit() : super(BackupSeedPhraseState.initial());

  final _walletRepo = WalletRepo();
  void initWallet() async {
    emit(state.copyWith(isLoading: true));
    await _walletRepo.createWallet();
    emit(state.copyWith(
        menmonicPhrases: _walletRepo.lastWallet!.menmonicPhrase.split(" ")));
    emit(state.copyWith(isLoading: false));
  }

  void toShow() {
    emit(state.copyWith(isShown: !state.isShown));
  }
}
