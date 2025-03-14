// ignore_for_file: must_be_immutable, file_names
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mended_soluctions/Presentation/Bloc/get_customer_service_request_bloc/get_customer_service_request_bloc.dart';
import '../../../../Data/service_type/service_type_model.dart';
import '../../../Bloc/service_type_bloc/service_type_bloc.dart';
import '../../../Bloc/service_type_bloc/service_type_event.dart';
import '../../../Bloc/service_type_bloc/service_type_state.dart';
import '../../../Widgets/MyButton.dart';
import '../../../Widgets/MyDropdownWithNoLogo.dart';
import '../../../Widgets/MyTextButton.dart';
import '../../../helper/Constants/MyColors.dart';
import '../../../helper/Constants/MySpaces.dart';

class FilterServices extends StatefulWidget {
  const FilterServices({super.key, required this.onDataReceived});
  final void Function(ServiceTypeModel therapy) onDataReceived;
  @override
  State<FilterServices> createState() => _FilterServicesState();
}

class _FilterServicesState extends State<FilterServices> {
  @override
  void initState() {
    ftoast.init(context);

    BlocProvider.of<ServiceTypeBloc>(context).add(GetServiceType());
    super.initState();
  }

  FToast ftoast = FToast();
  void showToast(String msg) {
    ftoast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: kWhiteColor,
        ),
        child: Text(
          msg,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  ServiceTypeModel? serviceTypeModel;
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final dateController = TextEditingController();
  DateTime? filterdate;
  TimeOfDay? fromDate, toDate;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: SizedBox(
        width: double.infinity,
        height: Get.height * 0.3,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          elevation: 10,
          //   margin: const EdgeInsets.symmetric(horizontal: 18),
          color: kPrimaryColor,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: kWhiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _headerText(context, 'Filter'),
                  _serviceTypeTextBox(),
                  verticalSpacing20,
                  buttons(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttons(BuildContext context) => Row(
        children: [
          Expanded(
            child: MyButton(
              onPressed: () => submit(),
              fontColor: kPrimaryColor,
              buttonText: 'Done',
            ),
          ),
          Expanded(
            child: MyTextButton(
              text: "Reset",
              color: Colors.red,
              onPressed: () {
                BlocProvider.of<GetCustomerServiceRequestBloc>(context)
                    .add(GetAllCustomerServiceRequestByCustomerEvent());
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
  void submit() {
    widget.onDataReceived(serviceTypeModel!);

    BlocProvider.of<GetCustomerServiceRequestBloc>(context).add(
      GetAllCustomerServiceRequestByCustomerEvent(
        serviceTypeId: serviceTypeModel?.id ?? null,
      ),
    );
    Navigator.of(context).pop();
  }

  Widget _serviceTypeTextBox() =>
      BlocBuilder<ServiceTypeBloc, ServiceTypeState>(
        builder: (context, state) {
          if (state is ServiceTypeLoadingState) {
          } else if (state is ServiceTypeLoadedState) {
            return MyDropDownTextFieldwithNoLogo(
              hintText: 'Therapy Type',
              value: ServiceTypeModel,
              validator: (val) {
                return null;
              },
              onChanged: (newValue) {
                setState(() {
                  serviceTypeModel = state.model!
                      .singleWhere((licenseType) => licenseType == newValue);
                });
              },
              items: state.model?.map((val) {
                return DropdownMenuItem<ServiceTypeModel>(
                  value: val,
                  child: Text(val.name!),
                );
              }).toList(),
            );
          } else if (state is ServiceTypeErrorState) {}
          return Container();
        },
      );

  Widget _headerText(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: const TextStyle(
                    color: kBlackColor38,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, color: kBlackColor38)),
          ],
        ),
      );
}
