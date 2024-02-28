import 'package:flutter/material.dart';
import 'package:rabby_wallet/data/repositories/wallet_repo.dart';
import 'app/rabby_wallet_app.dart';
import 'data/repositories/exchange_rates_repo.dart';
import 'data/repositories/hive_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveRepo().init();
  await WalletRepo().importLastSavedWallet();
  ExchangeRatesRepo().manuallySetRates().then((value) {
    ExchangeRatesRepo().startRateUpdateTimer();
  });
  runApp(const RabbyWalletApp());
}
