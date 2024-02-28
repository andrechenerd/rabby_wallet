import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_images.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/features/import_key_flow/components/next_button.dart';
import 'package:rabby_wallet/features/import_key_flow/import_private_key/import_private_key_screen.dart';
import '../../core/constants/app_icons.dart';
import 'import_seed_phrase/import_seed_phrase_screen.dart';

class SelectImportTypeScreenBuilder extends StatelessWidget {
  const SelectImportTypeScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectImportTypeScreen();
  }
}

class SelectImportTypeScreen extends StatelessWidget {
  const SelectImportTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                ),
                child:
                    //  Image.asset("assets/images/Mask group.png",

                    Column(
                  children: [
                    const Text(
                      "Select Import Method",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ).onlyPadding(top: 30, bottom: 27),
                    Image.asset(
                      AppImages.message,
                      height: 300,
                    )
                  ],
                )),
            NextButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ImportSeedPhraseScreenBuilder()));
                    },
                    iconPath: AppIcons.importKey,
                    title: "Import Seed Phrase")
                .paddingLTRB(16, 30, 16, 12),
            NextButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ImportPrivateKeyScreenBuilder()));
                    },
                    iconPath: AppIcons.key2,
                    title: "Import Private Key")
                .symmetricPadding(horizontal: 16),
          ],
        ),
      ),
    ));
  }
}
