import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/app/navigation/app_navigator.dart';
import 'package:rabby_wallet/app/navigation/routes.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';

import '../../data/repositories/hive_repo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final navigator = context.read<AppNavigator>();
      final isFirstAppOpen = HiveRepo().isFirstAppOpen;
      if (isFirstAppOpen) {
        navigator.pushNamedAndRemoveUntil(routeName: Routes.welcome);
        return;
      }
      final pinCode = HiveRepo().pinCode;
      if (pinCode == null) {
        navigator.pushNamedAndRemoveUntil(routeName: Routes.home);
        return;
      }
      navigator.pushNamedAndRemoveUntil(
        routeName: Routes.passCode,
        args: {
          "title": "Enter Passcode",
          "onComplete": (String value) {
            if(pinCode != value) return;
            navigator.pushNamed(routeName: Routes.home);
          },
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
    );
  }
}
