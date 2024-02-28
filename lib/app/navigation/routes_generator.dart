import 'package:flutter/material.dart';
import 'package:rabby_wallet/app/navigation/routes.dart';
import 'package:rabby_wallet/features/add_contact_flow/add_contact/add_contact_screen.dart';
import 'package:rabby_wallet/features/add_wallet/add_wallet_screen.dart';
import 'package:rabby_wallet/features/home/home_screen.dart';
import 'package:rabby_wallet/features/home/swap/swap_screen.dart';
import 'package:rabby_wallet/features/new_phrase_flow/back_up/back_up_screen.dart';
import 'package:rabby_wallet/features/new_phrase_flow/backup_seed_phrase/backup_seed_phrase_screen.dart';
import 'package:rabby_wallet/features/passcode/passcode_screen.dart';
import 'package:rabby_wallet/features/home/settings/auto_lock_timer/auto_lock_timer_screen.dart';
import 'package:rabby_wallet/features/home/settings/connected_sites/connected_sites_screen.dart';
import 'package:rabby_wallet/features/home/settings/default_currency/default_currency_screen.dart';
import 'package:rabby_wallet/features/home/settings/language/language_screen.dart';
import 'package:rabby_wallet/features/home/settings/notifications/manage_threshold/manage_threshold_screen.dart';
import 'package:rabby_wallet/features/home/settings/notifications/notifications_screen.dart';
import 'package:rabby_wallet/features/home/settings/protection/protection_screen.dart';
import 'package:rabby_wallet/features/home/settings/rpc_nodes/rpc_nodes_screen.dart';
import 'package:rabby_wallet/features/home/settings/settings_screen.dart';
import 'package:rabby_wallet/features/home/settings/sound_and_vibration/sound_and_vibration_screen.dart';
import 'package:rabby_wallet/features/home/settings/theme/theme_screen.dart';
import 'package:rabby_wallet/features/send/send_screen.dart';
import 'package:rabby_wallet/features/send_to_address/send_to_address_screen.dart';
import 'package:rabby_wallet/features/splash/splash_screen.dart';
import 'package:rabby_wallet/features/welcome_screen/welcome_screen.dart';

import '../../features/import_key_flow/select_import_type_screen.dart';
import '../../features/new_phrase_flow/created_successfully/created_successsfully_screen.dart';
import '../../features/receive/receive_screen.dart';
import '../../features/transaction/transaction_screen.dart';

class RoutesGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          _getPage(settings),
    );
  }

  static Widget _getPage(RouteSettings settings) {
    final args = (settings.arguments ?? {}) as Map;
    switch (settings.name) {
      case Routes.splash:
        return const SplashScreen();
      case Routes.passCode:
        return PassCodeScreenBuilder(
          title: args["title"],
          subtitle: args["subtitle"],
          onComplete: args["onComplete"],
        );
      case Routes.welcome:
        return const WelcomeScreenBuilder();
      case Routes.addContact:
        return const AddContactScreenBuilder();
      case Routes.backup:
        return const BackUpScreenBuilder();
      case Routes.settings:
        return const SettingsScreen();
      case Routes.connectedSites:
        return const ConnectedSitesScreen();
      case Routes.rpcNodes:
        return const RpcNodesScreen();
      case Routes.theme:
        return const ThemeScreen();
      case Routes.language:
        return const LanguageScreen();
      case Routes.defaultCurrency:
        return const DefaultCurrencyScreen();
      case Routes.soundAndVibration:
        return const SoundAndVibrationScreen();
      case Routes.autoLockTimer:
        return const AutoLockTimerScreen();
      case Routes.protection:
        return const ProtectionScreen();
      case Routes.notifications:
        return const NotificationsScreen();
      case Routes.manageThreshold:
        return const ManageThresholdScreen();
      case Routes.selectImportType:
        return const SelectImportTypeScreenBuilder();
      case Routes.swap:
        return const SwapScreen();
      case Routes.createdSuccessfully:
        return const CreatedSuccessfullyScreenBuilder();
      case Routes.backupSeedPhrase:
        return const BackUpSeedPhraseScreenBuilder();
      case Routes.home:
       return const HomeScreenBuilder();
      case Routes.receive:
        return const ReceiveScreenBuilder();
      case Routes.sendToAddress:
        return const SendToAddressScreenBuilder();
      case Routes.transaction:
        return const TransactionScreenBuilder();
      case Routes.send:
        return const SendScreenBuilder();
      case Routes.addWallet:
        return const  AddWalletScreenBuilder();
    }

    return const Scaffold(
      body: Center(
        child: Text("Page not found:("),
      ),
    );
  }
}
