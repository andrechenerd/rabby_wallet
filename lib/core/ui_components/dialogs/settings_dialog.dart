// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_expandable_button.dart';
import 'package:rabby_wallet/core/ui_components/others/app_textfield.dart';

Future<void> showResetAppDialog(
  BuildContext context, {
  required TextEditingController textFieldCTRL,
  required VoidCallback onPositiveAnswerButtonTap,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return SettingsDialog(
        title: "Reset App",
        titleIcon: AppIcons.resetAppOutlined,
        subTitle:
            "This will delete all the data you have created on\nArbitrum. After making sure that you have a proper\nbackup, ENTER “RESET” to reset the App",
        onPositiveAnswerButtonTap: onPositiveAnswerButtonTap,
        positiveAnswerButtonContentColor: AppColors.primaryGrey,
        positiveAnswerButtonBgColor: AppColors.white,
        positiveAnswerButtonIcon: AppIcons.deleteOutlined,
        positiveAnswerButtonText: "Delete",
        textFieldCTRL: textFieldCTRL,
        textfieldHintText: "ENTER “RESET”",
      );
    },
  );
}

Future<void> showConnectedSitesDialog(
  BuildContext context, {
  required TextEditingController textFieldCTRL,
  required VoidCallback onPositiveAnswerButtonTap,
  required VoidCallback onPasteFromClipboard,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return SettingsDialog(
        title: "Connected sites",
        titleIcon: AppIcons.connectedSitesOutlined,
        onPositiveAnswerButtonTap: onPositiveAnswerButtonTap,
        positiveAnswerButtonContentColor: AppColors.primaryBlue,
        positiveAnswerButtonBgColor: AppColors.lightBlue,
        positiveAnswerButtonIcon: AppIcons.addCircleOutlined,
        positiveAnswerButtonText: "Add",
        textFieldCTRL: textFieldCTRL,
        textfieldHintText: "Add Site Connection",
        onPasteFromClipboard: onPasteFromClipboard,
      );
    },
  );
}

Future<void> showAddNodeDialog(
  BuildContext context, {
  required TextEditingController textFieldCTRL,
  required VoidCallback onPositiveAnswerButtonTap,
  required VoidCallback onPasteFromClipboard,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return SettingsDialog(
        title: "Custom",
        onPositiveAnswerButtonTap: onPositiveAnswerButtonTap,
        positiveAnswerButtonContentColor: AppColors.primaryBlue,
        positiveAnswerButtonBgColor: AppColors.lightBlue,
        positiveAnswerButtonIcon: AppIcons.checkCircleOutlined,
        positiveAnswerButtonText: "Confirm",
        textFieldCTRL: textFieldCTRL,
        textfieldHintText: "Add Node",
        onPasteFromClipboard: onPasteFromClipboard,
      );
    },
  );
}

Future<void> showRestartpDialog(
  BuildContext context, {
  required VoidCallback onPositiveAnswerButtonTap,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return SettingsDialog(
        title: "Restart Required",
        subTitle:
            "To finish switching the RPC node, Arbitrum\nneeds to restart.",
        onPositiveAnswerButtonTap: onPositiveAnswerButtonTap,
        positiveAnswerButtonContentColor: AppColors.primaryBlue,
        positiveAnswerButtonBgColor: AppColors.lightBlue,
        positiveAnswerButtonIcon: AppIcons.resetAppOutlined,
        positiveAnswerButtonText: "Restart",
      );
    },
  );
}

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({
    Key? key,
    this.titleIcon,
    required this.title,
    this.subTitle,
    this.textfieldHintText,
    this.textFieldCTRL,
    this.onPasteFromClipboard,
    required this.onPositiveAnswerButtonTap,
    required this.positiveAnswerButtonContentColor,
    required this.positiveAnswerButtonBgColor,
    required this.positiveAnswerButtonIcon,
    required this.positiveAnswerButtonText,
  }) : super(key: key);
  final String? titleIcon;
  final String title;
  final String? subTitle;
  final String? textfieldHintText;
  final TextEditingController? textFieldCTRL;
  final VoidCallback? onPasteFromClipboard;
  final VoidCallback onPositiveAnswerButtonTap;
  final Color positiveAnswerButtonContentColor;
  final Color positiveAnswerButtonBgColor;
  final String positiveAnswerButtonIcon;
  final String positiveAnswerButtonText;

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: AppColors.transparent,
      child: GestureDetector(
        onTap: () {
          if (widget.textFieldCTRL != null &&
              widget.textfieldHintText != null) {
            focusNode.unfocus();
          }
        },
        child: Container(
          color: AppColors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                constraints: const BoxConstraints(minHeight: 186),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.titleIcon != null)
                          Image.asset(
                            widget.titleIcon!,
                            width: 24,
                            color: AppColors.darkGrey,
                          ).onlyPadding(right: 16),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryGrey,
                          ),
                        ),
                      ],
                    ).onlyPadding(bottom: 18),
                    if (widget.subTitle != null)
                      FittedBox(
                        child: Text(
                          widget.subTitle!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryGrey,
                            height: 1.7,
                          ),
                          textAlign: TextAlign.center,
                        ).onlyPadding(bottom: 24),
                      ),
                    if (widget.textFieldCTRL != null &&
                        widget.textfieldHintText != null)
                      AppTextField(
                        focusNode: focusNode,
                        controller: widget.textFieldCTRL!,
                        hintText: widget.textfieldHintText!,
                        borderColor: AppColors.secondaryWhite,
                        fillColor: AppColors.secondaryWhite,
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGrey,
                        ),
                      ),
                    if (widget.onPasteFromClipboard != null)
                      GestureDetector(
                        onTap: widget.onPasteFromClipboard,
                        child: Container(
                          color: AppColors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppIcons.pasteOutlined,
                                      height: 24, color: AppColors.primaryBlue)
                                  .onlyPadding(right: 6),
                              const Text(
                                "Paste from clipboard",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryBlue,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
              Row(
                children: [
                  AppExpandableButton(
                    bgColor: AppColors.white,
                    contentColor: AppColors.primaryGrey,
                    text: "Cancel",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ).onlyPadding(right: 8).expanded(),
                  AppExpandableButton(
                    onTap: widget.onPositiveAnswerButtonTap,
                    icon: widget.positiveAnswerButtonIcon,
                    bgColor: widget.positiveAnswerButtonBgColor,
                    contentColor: widget.positiveAnswerButtonContentColor,
                    text: widget.positiveAnswerButtonText,
                  ).expanded(),
                ],
              ).onlyPadding(top: 8)
            ],
          ).allPadding(16),
        ),
      ),
    );
  }
}
