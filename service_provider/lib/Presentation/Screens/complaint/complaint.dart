import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../Bloc/complaint_bloc/complaint_bloc.dart';
import '../../Widgets/MyAppBar.dart';
import '../../helper/Constants/MyColors.dart';
import '../../helper/ReusedFunctions.dart';
import '../ErrorHandling/EmptyDataScreen.dart';
import '../ErrorHandling/InternalServerErrorScreen.dart';
import 'add_complaint.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  _ComplaintScreenState createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  void initState() {
    context.read<ComplaintBloc>().add(GetComplaintEvent());
    super.initState();
  }

  _getStatusColor(int status) {
    switch (status) {
      case 1:
        return Colors.green[300];
      case 2:
        return Colors.yellow[300];
      case 3:
        return Colors.red;
      default:
        return kBlackColor38;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Complaints',
      ),
      body: BlocListener<ComplaintBloc, ComplaintState>(
        listener: (context, state) {
          if (state is ComplaintSuccess) {
            context.read<ComplaintBloc>().add(GetComplaintEvent());
          }
        },
        child: Expanded(
          child: BlocBuilder<ComplaintBloc, ComplaintState>(
            builder: (context, state) {
              if (state is ComplaintLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: kSecondaryColor,
                ));
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
                          trailing: Container(
                            padding: const EdgeInsets.only(
                                top: 4, bottom: 4, left: 5, right: 10),
                            margin: const EdgeInsets.only(
                                top: 2, bottom: 2, left: 10),
                            decoration: BoxDecoration(
                                color: _getStatusColor(service.status ?? -1),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              getComplaintStatusString(service.status ?? -1),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kBlackColor,
                                  fontSize: 10),
                            ),
                          ),
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
