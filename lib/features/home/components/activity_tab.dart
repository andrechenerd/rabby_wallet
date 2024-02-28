import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rabby_wallet/core/constants/app_colors.dart';
import 'package:rabby_wallet/core/constants/app_icons.dart';
import 'package:rabby_wallet/features/home/components/recieve_send_button.dart';
import 'package:rabby_wallet/features/home/cubit.dart';
import 'package:rabby_wallet/features/home/state.dart';

class ActivityTab extends StatefulWidget {
  const ActivityTab({super.key});

  @override
  State<ActivityTab> createState() => _ActivityTabState();
}

class _ActivityTabState extends State<ActivityTab> {
  HomeScreenCubit cubit = HomeScreenCubit();

  @override
  void initState() {
    cubit.getTransactions();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit,HomeScreenState>(
      bloc: cubit,
      builder: (context,state) {
        return Expanded(
          child: Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 28,
            ),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Container(
              height: 300,
              child: ListView(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Activity",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryGrey,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          AppIcons.trash,
                          height: 24,
                        ),
                      )
                    ],
                  ),
            
                  ...List.generate(state.transactions.length, (index) => 
                  
                                  RecieveSendButton(
                    avax: state.transactions[index].price,
                    walletKey: state.transactions[index].fromAddress,
                    isResive: true,
                    dateTime:  state.transactions[index].transactionDate,
                  ),
                  ),
            
                  // RecieveSendButton(
                  //   avax: 0.1111,
                  //   walletKey: "fjfj242jv",
                  //   isResive: false,
                  //   dateTime: DateTime.now(),
                  // ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
