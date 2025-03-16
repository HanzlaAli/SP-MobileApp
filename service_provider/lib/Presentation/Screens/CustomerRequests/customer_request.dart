import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mended_soluctions/Core/Routes/Routes.dart';
import 'customer_request_detail_screen.dart';
import 'widgets/customer_request_service_details.dart';
import 'widgets/filter_bottom_sheet.dart';
import '../../../Data/Models/service_type/service_type_model.dart';
import '../../Bloc/get_customer_service_request_bloc/get_customer_service_request_bloc.dart';
import '../../helper/Constants/MyColors.dart';
import '../ErrorHandling/EmptyDataScreen.dart';
import '../ErrorHandling/InternalServerErrorScreen.dart';

class CustomerRequestScreen extends StatefulWidget {
  const CustomerRequestScreen({super.key});

  @override
  _CustomerRequestScreenState createState() => _CustomerRequestScreenState();
}

class _CustomerRequestScreenState extends State<CustomerRequestScreen> {
  ServiceTypeModel? serviceType;
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
      backgroundColor: kWhiteColor,
      body: Column(
        children: [
          // Search Box
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon:
                          const Icon(Icons.search, color: kPrimaryColor),
                      focusColor: kPrimaryColor,
                      filled: true,
                      fillColor: Colors.grey[200],
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(color: kPrimaryColor),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                    onChanged: (value) {
                      setState(() {
                        context.read<GetCustomerServiceRequestBloc>().add(
                              GetAllCustomerServiceRequestByCustomerEvent(
                                filter: value,
                                serviceTypeId: serviceType?.id,
                              ),
                            );
                      });
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.bottomSheet(FilterServices(
                    onDataReceived: (serviceType) {
                      this.serviceType = serviceType;
                    },
                  ));
                },
                icon: const Icon(
                  Icons.filter_alt_rounded,
                  color: kSecondaryColor,
                ),
                iconSize: 30.0,
                padding: const EdgeInsets.all(10.0),
                splashColor: kPrimaryColor.withOpacity(0.2),
                tooltip: 'Filter',
              )
            ],
          ),
          // List of Services
          Expanded(
            child: BlocBuilder<GetCustomerServiceRequestBloc,
                GetCustomerServiceRequestState>(
              builder: (context, state) {
                if (state is GetCustomerServiceRequestLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: kSecondaryColor,
                  ));
                } else if (state is GetCustomerServiceRequestLoaded) {
                  if (state.model.isEmpty) {
                    return EmptyDataScreen(text: 'No Service Requests');
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.model.length,
                        itemBuilder: (context, index) {
                          final customerRequest = state.model[index];
                          return CustomerRequestListItems(
                            model: customerRequest,
                            onTap: () {
                              navigatorPush(
                                context,
                                CustomerRequestDetailScreen(
                                  model: customerRequest,
                                ),
                              );
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
