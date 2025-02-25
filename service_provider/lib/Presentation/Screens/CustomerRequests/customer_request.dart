import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../Bloc/get_customer_service_request_bloc/get_customer_service_request_bloc.dart';
import '../ErrorHandling/EmptyDataScreen.dart';
import '../ErrorHandling/InternalServerErrorScreen.dart';
import 'customer_request_detail_screen.dart';

class CustomerRequestScreen extends StatefulWidget {
  const CustomerRequestScreen({super.key});

  @override
  _CustomerRequestScreenState createState() => _CustomerRequestScreenState();
}

class _CustomerRequestScreenState extends State<CustomerRequestScreen> {
  @override
  void initState() {
    context
        .read<GetCustomerServiceRequestBloc>()
        .add(GetAllCustomerServiceRequestByCustomerEvent(filter: null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search Box
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search services...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  context.read<GetCustomerServiceRequestBloc>().add(
                      GetAllCustomerServiceRequestByCustomerEvent(
                          filter: value));
                });
              },
            ),
          ),
          // List of Services
          Expanded(
            child: BlocBuilder<GetCustomerServiceRequestBloc,
                GetCustomerServiceRequestState>(
              builder: (context, state) {
                if (state is GetCustomerServiceRequestLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetCustomerServiceRequestLoaded) {
                  if (state.model.isEmpty) {
                    return EmptyDataScreen(text: 'No Service Requests');
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
                              Get.to(CustomerRequestDetailScreen(
                                  title: service.title.toString(),
                                  serviceType: service.serviceType.toString(),
                                  description: service.description.toString(),
                                  imagePaths: service.images ?? [],
                                  budget: double.tryParse(
                                          service.budget.toString()) ??
                                      0));
                            },
                          );
                        },
                      ),
                    );
                  }
                } else if (state is GetCustomerServiceRequestError) {
                  return const InternalServerErrorScreen();
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
