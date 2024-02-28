import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';

import '../../constants/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? suffixIconPath;
  final List<TextInputFormatter>? formatters;
  final bool? isTopSharp;
  final bool obscure;
  final double minMaxHeight;
  final VoidCallback? onSuffixTap;
  final String? prefixIconPath;
  final void Function(String)? onChanged;
  final double suffixIconHeight;
  final Color fillColor;
  final TextAlign textAlign;
  final bool enabled;
  final TextStyle? hintStyle;
  final double width;
  final String? Function(String?)? validator;
  final TextInputType? kBoardType;
  final int? maxLines;
  final String? obscuringCharacter;
  final String? underLabelText;
  final Color? borderColor;
  final EdgeInsets? contentPadding;
  final FocusNode? focusNode;

  const AppTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.focusNode,
    this.minMaxHeight = 56,
    this.obscure = false,
    this.prefixIconPath,
    this.suffixIconPath,
    this.formatters,
    this.isTopSharp,
    this.onSuffixTap,
    this.onChanged,
    this.suffixIconHeight = 112,
    this.fillColor = Colors.white,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.validator,
    this.kBoardType,
    this.hintStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryGrey,
    ),
    this.width = 17.5,
    this.maxLines = 1,
    this.obscuringCharacter,
    this.underLabelText = '',
    this.borderColor,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: minMaxHeight,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: TextFormField(
            focusNode: focusNode,
            maxLines: maxLines,
            controller: controller,
            inputFormatters: formatters,
            obscureText: obscure,
            keyboardType: kBoardType,
            textAlign: textAlign,
            obscuringCharacter: obscuringCharacter ?? '●',
            onChanged: onChanged,
            enabled: enabled,
            validator: validator,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              constraints: BoxConstraints(
                maxHeight: minMaxHeight,
                minHeight: minMaxHeight,
              ),
              fillColor: fillColor,
              filled: true,
              hintText: hintText,
              hintStyle: hintStyle,
              contentPadding: contentPadding ??
                  const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
              suffixIconConstraints: const BoxConstraints(
                maxWidth: 100,
                minWidth: 36,
              ),
              prefixIconConstraints: const BoxConstraints(
                maxWidth: 100.5,
                minWidth: 32.5,
              ), 
              prefixIcon: prefixIconPath == null
                  ? null
                  : Image.asset(
                      prefixIconPath!,
                      width: 23,
                      height: 23,
                      color: AppColors.primaryGrey,
                    ).onlyPadding(left: 14,right: 14),
              suffixIcon: suffixIconPath != null
                  ? Image.asset(
                      suffixIconPath!,
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1,
                  color: borderColor ?? AppColors.primaryBlue,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1,
                  color: borderColor ?? AppColors.primaryBlue,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1,
                  color: borderColor ?? AppColors.primaryBlue,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1,
                  color: borderColor ?? AppColors.primaryBlue,
                ),
              ),
            ),
          ),
        ),
        if (underLabelText != null)
          Text(
            underLabelText!,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryBlue,
            ),
          ).onlyPadding(left: 16)
      ],
    );
  }
}
