import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rabby_wallet/app/navigation/app_navigator.dart';
import 'package:rabby_wallet/app/navigation/routes.dart';
import 'package:rabby_wallet/app/navigation/routes_generator.dart';


final _navigatorKey = GlobalKey<NavigatorState>();

class RabbyWalletApp extends StatefulWidget {
  const RabbyWalletApp({super.key});

  @override
  State<RabbyWalletApp> createState() => _RabbyWalletAppState();
}

class _RabbyWalletAppState extends State<RabbyWalletApp> {
  final navigator = AppNavigator(_navigatorKey);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider<AppNavigator>.value(
        value: navigator,
        child: WillPopScope(
          onWillPop: () {
            if (_navigatorKey.currentState?.canPop() ?? false) {
              _navigatorKey.currentState!.pop();
            }
            return Future.value(false);
          },
          child: Navigator(
            initialRoute: Routes.splash,
            key: _navigatorKey,
            onGenerateRoute: RoutesGenerator.onGenerateRoute,
          ),
        ),
      ),
    );
  }
}
