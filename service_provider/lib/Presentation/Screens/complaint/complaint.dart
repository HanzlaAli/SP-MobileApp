import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../Bloc/complaint_bloc/complaint_bloc.dart';
import '../../Bloc/get_customer_service_request_bloc/get_customer_service_request_bloc.dart';
import '../../Widgets/MyAppBar.dart';
import '../../helper/Constants/MyColors.dart';
import '../ErrorHandling/EmptyDataScreen.dart';
import '../ErrorHandling/InternalServerErrorScreen.dart';
import 'add_complaint.dart';
import 'complaint_detail_screen.dart';

class CustomerRequestScreen extends StatefulWidget {
  const CustomerRequestScreen({super.key});

  @override
  _CustomerRequestScreenState createState() => _CustomerRequestScreenState();
}

class _CustomerRequestScreenState extends State<CustomerRequestScreen> {
  @override
  void initState() {
    context.read<ComplaintBloc>().add(GetComplaintEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Home',
      ),
      body: BlocListener<ComplaintBloc, ComplaintState>(
        listener: (context, state) {
          if (state is ComplaintSuccess) {
            context
                .read<GetCustomerServiceRequestBloc>()
                .add(GetAllCustomerServiceRequestByCustomerEvent());
          }
        },
        child: Expanded(
          child: BlocBuilder<ComplaintBloc, ComplaintState>(
            builder: (context, state) {
              if (state is ComplaintLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ComplaintLoaded) {
                if (state.model.isEmpty) {
                  return EmptyDataScreen(text: 'No Complaints Found');
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.model.length,
                      itemBuilder: (context, index) {
                        final service = state.model[index];
                        return ListTile(
                          title: Text(service.title.toString()),
                          subtitle: Text(service.description.toString()),
                          onTap: () {
                            Get.to(ComplaintDetailScreen(
                              title: service.title.toString(),
                              description: service.description.toString(),
                            ));
                          },
                        );
                      },
                    ),
                  );
                }
              } else if (state is ComplaintError) {
                return const InternalServerErrorScreen();
              }
              return const SizedBox();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(const AddComplaint());
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.add,
          color: kWhiteColor,
        ),
      ),
    );
  }
}
