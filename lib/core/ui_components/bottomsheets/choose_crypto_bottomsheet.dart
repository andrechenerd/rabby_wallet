import 'package:flutter/material.dart';
import 'package:rabby_wallet/core/extensions/widget_extensions.dart';
import 'package:rabby_wallet/core/ui_components/others/app_button.dart';
import 'package:rabby_wallet/core/ui_components/others/app_textfield.dart';
import 'package:rabby_wallet/core/ui_components/others/managable_crypto_box.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_icons.dart';

class ChooseCryptoBottomsheet extends StatefulWidget {
  final VoidCallback onTap;
  const ChooseCryptoBottomsheet({
    super.key,
    required this.onTap,
  });

  @override
  State<ChooseCryptoBottomsheet> createState() =>
      _ChooseCryptoBottomsheetState();
}

class _ChooseCryptoBottomsheetState extends State<ChooseCryptoBottomsheet> {
  TextEditingController ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 40),
      height: MediaQuery.of(context).size.height*0.9 ,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 243, 245, 252),
                    border: Border.all(
                      width: 2,
                      color: AppColors.primaryGrey,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    AppIcons.clear,
                    color: AppColors.primaryGrey,
                  ),
                ),
              ),
              const Text(
                "Manage cryptos",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryGrey,
                ),
              ).onlyPadding(left: 16),
              const Spacer(),
              Image.asset(
                AppIcons.searchFilled,
                color: AppColors.primaryBlue,
                height: 20,
                width: 20,
              ),
            ],
          ),
          AppTextField(
            borderColor: AppColors.borderColor,
            controller: ctrl,
            hintText: "Search by Name",
            prefixIconPath: AppIcons.searchOutlined,
            fillColor: AppColors.lightBgColor,
            hintStyle: TextStyle(fontSize: 16, color: AppColors.darkGrey),
          ).onlyPadding(
            top: 30,
            bottom: 0,
          ),
          const ManagableCryptoBox(
            imagePath:
                "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
            coinName: "Bitcoin",
            coinShortName: "BTC",
          ),
          const ManagableCryptoBox(
            imagePath:
                "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1696501628",
            coinName: "Ethereum",
            coinShortName: "ETH",
          ),
          const ManagableCryptoBox(
            imagePath:
                "https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1696501970",
            coinName: "BNB",
            coinShortName: "BNB",
          ),
          const ManagableCryptoBox(
            imagePath:
                "https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1696501442",
            coinName: "XRP",
            coinShortName: "BNB",
          ),
          const ManagableCryptoBox(
            imagePath:
                "https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1696501932",
            coinName: "Bitcoin Cash",
            coinShortName: "BCH",
          ),
          const Spacer(),
          AppButton(
            bgColor: null,
            text: "Go to wallet",
            onTap: widget.onTap,
            horizontalMargin: 0,
          )
        ],
      ),
    );
  }
}
