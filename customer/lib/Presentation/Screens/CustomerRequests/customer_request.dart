import 'package:customer/Presentation/Bloc/get_customer_service_request_bloc/get_customer_service_request_bloc.dart';
import 'package:customer/Presentation/Screens/CustomerRequests/add_customer_request.dart';
import 'package:customer/Presentation/Screens/CustomerRequests/customer_request_detail_screen.dart';
import 'package:customer/Presentation/Widgets/MyAppBar.dart';
import 'package:customer/Presentation/Widgets/MyDrawer.dart';
import 'package:customer/Presentation/helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../Data/Models/CustomerRequestModels/customer_request_service_model.dart';
import '../../Bloc/create_or_edit_customer_service_request_bloc/create_or_edit_customer_service_request_bloc.dart';
import '../ErrorHandling/EmptyDataScreen.dart';
import '../ErrorHandling/InternalServerErrorScreen.dart';
import 'edit_customer_service_request.dart';

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
      appBar: MyAppBar(
        title: 'Home',
      ),
      drawer: const MyDrawer(),
      body: BlocListener<CreateOrEditCustomerServiceRequestBloc,
          CreateOrEditCustomerServiceRequestState>(
        listener: (context, state) {
          if (state is CreateOrEditCustomerServiceRequestSuccess) {
            context
                .read<GetCustomerServiceRequestBloc>()
                .add(GetAllCustomerServiceRequestByCustomerEvent());
          }
        },
        child: Column(
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
                            return Dismissible(
                              direction: DismissDirection.endToStart,
                              background: Container(
                                alignment: Alignment.centerRight,
                                color: kRedAccentColor,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: const Icon(
                                  Icons.delete,
                                  color: kWhiteColor,
                                ),
                              ),
                              confirmDismiss: (direction) async =>
                                  await _onDeletePopUp(context, service.id),
                              key: Key(service.id.toString()),
                              child: ListTile(
                                onLongPress: () =>
                                    _onEditPopUp(context, service),
                                title: Text(service.title.toString()),
                                subtitle: Text(service.description.toString()),
                                onTap: () {
                                  Get.to(CustomerRequestDetailScreen(
                                      title: service.title.toString(),
                                      serviceType:
                                          service.serviceType.toString(),
                                      description:
                                          service.description.toString(),
                                      imagePaths: service.images ?? [],
                                      budget: double.tryParse(
                                              service.budget.toString()) ??
                                          0));
                                },
                              ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(const AddCustomerRequest());
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.add,
          color: kWhiteColor,
        ),
      ),
    );
  }

  Future _onDeletePopUp(BuildContext context, int id) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: kWhiteColor,
            title: const Text(
              "Confirm",
              style: TextStyle(
                color: kBlackColor,
              ),
            ),
            content: const Text(
              "Are you sure you want to delete this image?",
              style: TextStyle(
                color: kBlackColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () {
                  BlocProvider.of<CreateOrEditCustomerServiceRequestBloc>(
                          context)
                      .add(DeleteCustomerServiceRequestEvent(id: id));
                  Navigator.pop(context);
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(color: kWhiteColor),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'No',
                  style: TextStyle(color: kWhiteColor),
                ),
              ),
            ],
          );
        },
      );

  void _onEditPopUp(
    BuildContext context,
    CustomerRequestServiceModel model,
  ) =>
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: kWhiteColor,
            title: const Text(
              "Confirm",
              style: TextStyle(
                color: kBlackColor,
              ),
            ),
            content: const Text(
              "Are you sure you want edit this Item",
              style: TextStyle(
                color: kBlackColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () {
                  Navigator.pop(context);
                  Get.dialog(EditCustomerRequest(
                    existingRequest: model,
                  ));
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(color: kWhiteColor),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'No',
                  style: TextStyle(color: kWhiteColor),
                ),
              ),
            ],
          );
        },
      );
}
