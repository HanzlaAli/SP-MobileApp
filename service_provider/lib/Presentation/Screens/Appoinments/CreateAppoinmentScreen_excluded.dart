// // ignore_for_file: must_be_immutable, file_names
// import '../../Presentation/Bloc/GetAppoinmentTypeBloc/get_appoinment_type_bloc.dart';
// import '../../Presentation/Widgets/MyButton.dart';
// import '../../Presentation/Widgets/MyDropdown.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
// import '../../../Core/helper/Constants/MyColors.dart';
// import '../../../Core/helper/Constants/MySpaces.dart';
// import '../../../Data/Models/AppoinmentModels/GetAppoinmentTypeModel.dart';
// import '../../../Data/Models/AppoinmentModels/GetCustomerRequestedAppointmentsModel.dart';

// class CreateAppoinmentScreen extends StatefulWidget {
//   static const routeName = "/appoinment-screen";
//   GetCustomerRequestedAppoinmentsModel model;
//   CreateAppoinmentScreen({super.key, required this.model});

//   @override
//   State<CreateAppoinmentScreen> createState() => _CreateAppoinmentScreenState();
// }

// class _CreateAppoinmentScreenState extends State<CreateAppoinmentScreen> {
//   final startTimeController = TextEditingController();

//   GetAppoinmentTypeModel? model;

//   final endTimeController = TextEditingController();

//   final dateController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Container();

//     // BlocListener<CreateAppoinmentBloc, CreateAppoinmentStateBase>(
//     //   listener: (context, state) {
//     //     if (state is CreateAppoinmentLoading) {
//     //       Get.snackbar("Loading...", "Please wait");
//     //     } else if (state is CreateAppoinmentSuccess) {
//     //       Get.snackbar("Success", "Appoinment Booked!");
//     //       navigatorPush(context, const AppoinmentsScreen());
//     //     } else if (state is CreateAppoinmentError) {
//     //       Get.snackbar("Opps", "Try Again");
//     //     }
//     //   },
//     //   child: Scaffold(
//     //     appBar: MyAppBar(
//     //       title: 'Book Appoinment',
//     //     ),
//     //     body: SingleChildScrollView(
//     //       child: Center(
//     //         child: Column(
//     //             mainAxisAlignment: MainAxisAlignment.center,
//     //             crossAxisAlignment: CrossAxisAlignment.center,
//     //             children: [
//     //               serviceDetails(),
//     //               verticalSpacing10,
//     //               appoinmentTypeTextField(),
//     //               verticalSpacing10,
//     //               startTimeTextBox(),
//     //               verticalSpacing10,
//     //               endTimeTextBox(),
//     //               verticalSpacing10,
//     //               dateTextBox(),
//     //               verticalSpacing20,
//     //               button(),
//     //               verticalSpacing10,
//     //             ]),
//     //       ),
//     //     ),
//     //   ),
//     // );
//   }

//   Widget serviceDetails() => Container(
//         padding: const EdgeInsets.all(10),
//         width: Get.width,
//         margin: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               '${widget.model.customerService!.name}',
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             verticalSpacing20,
//             Text(
//               '${widget.model.customerService!.customerName}',
//             ),
//             verticalSpacing20,
//             Text(
//               '${widget.model.customerService!.therapyName}',
//             ),
//             verticalSpacing20,
//             Text(
//               '${widget.model.customerService!.charges}\$',
//               style: const TextStyle(color: kPrimaryColor, fontSize: 15),
//             ),
//             verticalSpacing20,
//             Text(
//               '${widget.model.customerService!.numberOfTimesAvailable}x',
//               style: const TextStyle(fontSize: 15, color: kPrimaryColor),
//             ),
//             verticalSpacing20,
//             Text(
//               '${widget.model.customerService!.validTill}',
//               style: const TextStyle(fontSize: 15, color: kPrimaryColor),
//             ),
//           ],
//         ),
//       );

//   Widget appoinmentTypeTextField() =>
//       BlocBuilder<GetAppoinmentTypeBloc, GetAppoinmentTypeStateBase>(
//         builder: (context, state) {
//           if (state is GetAppoinmentTypeLoading) {
//           } else if (state is GetAppoinmentTypeLoaded) {
//             return MyDropDownTextField(
//               icon: Icons.medical_services_outlined,
//               hintText: 'Appoinment Type',
//               value: model == null ? state.model!.first : model!,
//               validator: (val) {
//                 return null;
//               },
//               onChanged: (newValue) {
//                 setState(() {
//                   model = state.model!
//                       .singleWhere((licenseType) => licenseType == newValue);
//                 });
//               },
//               items: state.model!.map((val) {
//                 return DropdownMenuItem<GetAppoinmentTypeModel>(
//                   value: val,
//                   child: Text(val.name!),
//                 );
//               }).toList(),
//             );
//           } else if (state is GetAppoinmentTypeError) {}
//           return Container();
//         },
//       );

//   Widget startTimeTextBox() => SizedBox(
//         width: (kIsWeb ? Get.width * 0.3 : Get.width * 0.8),
//         child: Material(
//           borderRadius: BorderRadius.circular(8),
//           color: Colors.black12,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               // CostumDatePicker(
//               //   onDateChange: (DateTime date) {
//               //     startTimeController.text = date.toIso8601String();
//               //   },
//               //   icon: Icons.access_time,
//               //   mode: CupertinoDatePickerMode.time,
//               //   enabled: true,
//               //   hintText: 'Start Time',
//               // ),
//             ],
//           ),
//         ),
//       );

//   Widget endTimeTextBox() => SizedBox(
//         width: (kIsWeb ? Get.width * 0.3 : Get.width * 0.8),
//         child: Material(
//           borderRadius: BorderRadius.circular(8),
//           color: Colors.black12,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               // CostumDatePicker(
//               //   onDateChange: (DateTime date) {
//               //     endTimeController.text = date.toIso8601String();
//               //   },
//               //   icon: Icons.access_time,
//               //   mode: CupertinoDatePickerMode.time,
//               //   enabled: true,
//               //   hintText: 'End Time',
//               // ),
//             ],
//           ),
//         ),
//       );

//   Widget dateTextBox() => SizedBox(
//         width: (kIsWeb ? Get.width * 0.3 : Get.width * 0.8),
//         child: Material(
//           borderRadius: BorderRadius.circular(8),
//           color: Colors.black12,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               // CostumDatePicker(
//               //   onDateChange: (DateTime date) {
//               //     dateController.text = date.toIso8601String();
//               //   },
//               //   icon: Icons.calendar_month,
//               //   mode: CupertinoDatePickerMode.date,
//               //   enabled: true,
//               //   hintText: 'Date',
//               // ),
//             ],
//           ),
//         ),
//       );

//   Widget button() => MyButton(
//         onPressed: () {
//           // BlocProvider.of<CreateAppoinmentBloc>(context).add(
//           //   CreateAppoinment(
//           //     model: CreateAppoinmentModel(
//           //       appointmentTypeId: model!.id,
//           //       date: dateController.text,
//           //       endTime: endTimeController.text,
//           //       startTime: startTimeController.text,
//           //       customerServiceId: widget.model.customerService!.id,
//           //     ),
//           // chatHeadModel: CreateChatHeadModel(
//           //     customerId: widget.model.customerService!.customerUId,
//           //     uId: widget.model.customerService!.serviceProviderUId),
//           //  ),
//           //  );
//         },
//         fontColor: kPrimaryColor,
//         buttonText: 'Book Now',
//       );
// }
