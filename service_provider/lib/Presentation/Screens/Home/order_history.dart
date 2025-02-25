import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mended_soluctions/Presentation/Widgets/MyAppBar.dart';
import 'package:mended_soluctions/Presentation/Widgets/MyDrawer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Core/Routes/Routes.dart';
import '../../Bloc/TransactionBloc/transaction_bloc.dart';
import '../../Widgets/MyTextButton.dart';
import '../../helper/Constants/MyColors.dart';
import '../../helper/Constants/MySpaces.dart';
import '../ErrorHandling/InternalServerErrorScreen.dart';
import '../WithDrawals/WithdrawalHistoryScreen.dart';
import '../WithDrawals/WithdrawalScreen.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height:195,
            child: _wallet(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20, // Replace with actual data length
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.history),
                    title: Text('Completed Service ${index + 1}'),
                    subtitle: Text('Details of completed service ${index + 1}'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Navigate to history details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _wallet() {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: _shimmer(context));
        } else if (state is TransactionLoaded) {
          return GestureDetector(
            onTap: () {},
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                //  side:
              ),
              shadowColor: kPrimaryColor,
              elevation: 10,
              margin: const EdgeInsets.all(12),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                margin: const EdgeInsets.all(12),
                height: 156,
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mended Solutions',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: kPrimaryColor),
                    ),
                    const Text(
                      'Current Balance',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 13),
                    ),
                    Text(
                      '${state.model?.amount ?? 0.0}\$',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 27),
                    ),
                    verticalSpacing10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              navigatorPush(
                                  context, const WithdrawHistoryScreen());
                            },
                            child: Row(
                              children: [
                                const Text(
                                  'Withdraw History',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 3, left: 2),
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                  ),
                                )
                              ],
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: 3, left: 2),
                          child: MyTextButton(
                              onPressed: () {
                                navigatorPush(
                                    context, const WithdrawRequestScreen());
                              },
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              text: 'Withdraw',
                              color: kBlackColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is TransactionError) {}
        return const InternalServerErrorScreen();
      },
    );
  }

  Widget _shimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[350]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width * 0.9,
          ),
        ),
      ),
    );
  }
}
