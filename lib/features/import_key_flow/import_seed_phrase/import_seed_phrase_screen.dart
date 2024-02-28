import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';
import 'package:rabby_wallet/features/new_phrase_flow/backup_seed_phrase/components/seed_phrase.dart';
import '../../../core/ui_components/others/app_expandable_button.dart';
import '../../home/settings/components/app_bar.dart';

class ImportSeedPhraseScreenBuilder extends StatelessWidget {
  const ImportSeedPhraseScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return const ImportSeedPhraseScreen();
  }
}

class ImportSeedPhraseScreen extends StatelessWidget {
  const ImportSeedPhraseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> words = [
      "word1",
      "word2",
      "word2",
      "word12",
      "word1",
      "word2",
      "word2",
      "word12",
      "word1",
      "word2",
      "word2",
      "word12",
      "word1",
      "word2",
      "word2",
      "word12",
    ];
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          children: [
            const SettingsAppBar(
              text: "Import Seed Phrase",
            ),
            GestureDetector(
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    const Text(
                      "I have a 12-word phrase",
                      style:
                          TextStyle(fontSize: 16, color: AppColors.primaryGrey),
                    ),
                    const Spacer(),
                    Image.asset(
                      AppIcons.arrowRigth,
                      height: 24,
                      color: AppColors.primaryGrey,
                    )
                  ],
                ),
              ),
            ).onlyPadding(top: 40),
            GridView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: words.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    crossAxisCount: 2,
                    mainAxisExtent: 50,
                    mainAxisSpacing: 10),
                itemBuilder: (_, index) {
                  return SeedPhraseItem(index: index + 1, phrase: words[index]);
                }).symmetricPadding(vertical: 40),
            Row(
              children: [
                AppExpandableButton(
                  icon: AppIcons.showKey,
                  bgColor: AppColors.lightBlue,
                  contentColor: AppColors.primaryBlue,
                  text: "Show key",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ).expanded(),
                const SizedBox(
                  width: 7,
                ),
                AppExpandableButton(
                  icon: AppIcons.pasteOutlined,
                  bgColor: AppColors.white,
                  contentColor: AppColors.primaryGrey,
                  text: "Paste",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ).expanded(),
                Image.asset(
                  AppIcons.delete,
                  height: 46,
                ),
              ],
            ).onlyPadding(bottom: 23),
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
            AppButton(
              text: "Confirm",
              onTap: () {
               
              }, 
              horizontalMargin: 0,
            ).onlyPadding(top: 34)
          ],
        ),
      ),
    ));
  }
}
