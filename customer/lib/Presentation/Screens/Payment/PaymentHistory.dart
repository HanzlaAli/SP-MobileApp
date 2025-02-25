import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../Presentation/Bloc/TransactionBloc/transaction_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Data/Models/TransactionModels/GetTranscationHistoryModel.dart';
import '../../Widgets/MyAppBar.dart';
import '../../Widgets/MyDrawer.dart';
import '../../helper/Constants.dart';
import '../../helper/ReusedFunctions.dart';
import '../ErrorHandling/EmptyDataScreen.dart';
import '../ErrorHandling/InternalServerErrorScreen.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  @override
  void initState() {
    BlocProvider.of<TransactionBloc>(context).add(GetTransactionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int columnCount = getCount(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: MyAppBar(
        title: 'History',
        isDrawer: true,
      ),
      drawer: const MyDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<TransactionBloc>(context).add(GetTransactionEvent());
        },
        child: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state is TransactionLoading) {
              return _shimmer(context);
            } else if (state is TransactionLoaded) {
              if (state.model?.length == 0) {
                return Center(
                  child: EmptyDataScreen(text: 'Empty!'),
                );
              } else {
                return ListView.builder(
                    itemCount: state.model!.length,
                    itemBuilder: (context, rowindex) {
                      return Row(
                        children: List.generate(
                          columnCount,
                          (columnindex) {
                            final int index =
                                rowindex * columnCount + columnindex;
                            if (index >= state.model!.length) {
                              return Expanded(child: Container());
                            } else {
                              return Expanded(
                                child: MyCard(model: state.model![index]),
                              );
                            }
                          },
                        ),
                      );
                    });
              }
            } else if (state is TransactionError) {
              return const Center(
                child: InternalServerErrorScreen(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  SizedBox _shimmer(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 140,
                    width: getWidth(MediaQuery.of(context).size.width),
                  ),
                ),
              ),
            ),
            itemCount: 4,
          ),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  MyCard({Key? key, this.model}) : super(key: key);
  GetTransactionHistoryModel? model;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.only(top: 15),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: _buildTop(context),
      ),
    );
  }

  ListTile _buildTop(BuildContext context) {
    return ListTile(
      // leading: GestureDetector(
      //   onTap: () => Get.to(const ServiceProviderProfileScreen()),
      //   child: CircleAvatar(
      //     radius: 30,
      //     child:
      //         SvgPicture.asset('assets/Images/serviceProvider-male.svg'),
      //   ),
      // ),
      trailing: Text(
        DateFormat('dd-MM-yyyy').format(DateTime.parse(model!.updatedOn!)),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      title: Text(
        'To : ${model?.serviceProvider?.fullName}',
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '\$${model?.totalAmount}',
        style: const TextStyle(
            color: kSecondaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
