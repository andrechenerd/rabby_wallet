import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';
import 'package:rabby_wallet/core/ui_components/others/app_textfield.dart';

import '../../home/settings/components/app_bar.dart';

class ImportPrivateKeyScreenBuilder extends StatelessWidget {
  const ImportPrivateKeyScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImportPrivateKeyScreen();
  }
}

class ImportPrivateKeyScreen extends StatefulWidget {
  const ImportPrivateKeyScreen({super.key});

  @override
  State<ImportPrivateKeyScreen> createState() => _ImportPrivateKeyScreenState();
}

class _ImportPrivateKeyScreenState extends State<ImportPrivateKeyScreen> {
  TextEditingController ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SettingsAppBar(
              text: "Import Seed Phrase",
            ),
            const Spacer(
              flex: 2,
            ),
            AppTextField(
              controller: ctrl,
              hintText: "Enter your Private key",
              borderColor: AppColors.darkGrey,
            ),
            const Text(
              "What is a Seed Phrase?",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.primaryGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              "A 12, 18 or 24- word phrase used to control your assets.",
              style: TextStyle(fontSize: 12, color: AppColors.darkGrey),
            ).onlyPadding(bottom: 16),
            const Text(
              "Is it safe to import it in Rabby?",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.primaryGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              "Yes, it will be stored locally on your browser and only accessible to you.",
              style: TextStyle(fontSize: 12, color: AppColors.darkGrey),
            ),
            const Spacer(
              flex: 5,
            ),
            AppButton(
              text: "Confirm",
              onTap: () {},
              horizontalMargin: 0,
            ).onlyPadding(top: 34)
          ],
        ).symmetricPadding(horizontal: 16, vertical: 40),
      ),
    ));
  }
}
