// // ignore_for_file: file_names
// import '../../Core/Routes/Routes.dart';
// import '../../Presentation/Bloc/GetAppoinmentTypeBloc/get_appoinment_type_bloc.dart';
// import '../../Presentation/Screens/Appoinments/CreateAppoinmentScreen.dart';
// import '../../Presentation/Screens/ErrorHandling/EmptyDataScreen.dart';
// import '../../Presentation/Screens/ErrorHandling/InternalServerErrorScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../../Core/helper/Constants/MyColors.dart';
// import '../../../Core/helper/ReusedFunctions.dart';
// import '../../Bloc/GetRequestedAppoinmentsOfCustomerBloc/get_requested_appoinments_of_customer_bloc.dart';
// import '../../Widgets/MyAppBar.dart';
// import '../../Widgets/MyButton.dart';
// import '../../Widgets/MyDrawer.dart';

// class CustomerBookedServicesScreen extends StatefulWidget {
//   const CustomerBookedServicesScreen({super.key});

//   @override
//   State<CustomerBookedServicesScreen> createState() =>
//       _CustomerBookedServicesScreenState();
// }

// class _CustomerBookedServicesScreenState
//     extends State<CustomerBookedServicesScreen> {
//   @override
//   void initState() {
//     BlocProvider.of<GetRequestedAppoinmentsOfCustomerBloc>(context)
//         .add(GetAllRequestedAppoinments());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final int columnCount = getCount(MediaQuery.of(context).size.width);
//     return Scaffold(
//       drawer: const MyDrawer(),
//       appBar: MyAppBar(
//         title: 'Appointment Requests',
//       ),
//       body: BlocBuilder<GetRequestedAppoinmentsOfCustomerBloc,
//           GetRequestedAppoinmentsOfCustomerStateBase>(
//         builder: (context, state) {
//           if (state is GetRequestedAppoinmentsOfCustomerLoading) {
//             return _shimmer(context);
//           } else if (state is GetRequestedAppoinmentsOfCustomerLoaded) {
//             if (state.model?.length == 0) {
//               return Center(
//                 child: EmptyDataScreen(text: 'Empty!'),
//               );
//             } else {
//               return ListView.builder(
//                   itemCount: state.model!.length,
//                   itemBuilder: (context, rowindex) {
//                     return Row(
//                       children: List.generate(
//                         columnCount,
//                         (columnindex) {
//                           final int index =
//                               rowindex * columnCount + columnindex;
//                           if (index >= state.model!.length) {
//                             return Expanded(child: Container());
//                           } else {
//                             return Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                   margin: const EdgeInsets.only(top: 15),
//                                   elevation: 10,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(10),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         ListTile(
//                                           // leading: GestureDetector(
//                                           //   onTap: () => Get.to(const ServiceProviderProfileScreen()),
//                                           //   child: CircleAvatar(
//                                           //     radius: 30,
//                                           //     child:
//                                           //         SvgPicture.asset('assets/Images/serviceProvider-male.svg'),
//                                           //   ),
//                                           // ),

//                                           title: Text(
//                                             state.model![index].customerService!
//                                                     .name ??
//                                                 "",
//                                             style: const TextStyle(
//                                                 fontSize: 17,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           subtitle: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(state
//                                                       .model![index]
//                                                       .customerService!
//                                                       .therapyName ??
//                                                   ""),
//                                               Text(state
//                                                       .model![index]
//                                                       .customerService!
//                                                       .customerName ??
//                                                   ""),
//                                               Text(
//                                                 '${state.model![index].customerService!.charges}\$  (${state.model![index].customerService!.numberOfTimesAvailable}) xTimes',
//                                                 style: const TextStyle(
//                                                     color: kSecondaryColor),
//                                               ),
//                                             ],
//                                           ),
//                                           trailing: Text(
//                                             DateFormat('dd-MM-yyyy').format(
//                                                 DateTime.parse(state
//                                                     .model![index]
//                                                     .customerService!
//                                                     .validTill!)),
//                                             style: const TextStyle(
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                         Container(
//                                           alignment: Alignment.bottomRight,
//                                           child: Card(
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(24),
//                                             ),
//                                             elevation: 5,
//                                             child: MyButton(
//                                               width: 120,
//                                               textSize: 16,
//                                               onPressed: () {
//                                                 BlocProvider.of<
//                                                             GetAppoinmentTypeBloc>(
//                                                         context)
//                                                     .add(GetAppoinmentTypes());
//                                                 navigatorPush(
//                                                     context,
//                                                     CreateAppoinmentScreen(
//                                                       model:
//                                                           state.model![index],
//                                                     ));
//                                               },
//                                               fontColor: kWhiteColor,
//                                               bgColor: kPrimaryColor,
//                                               buttonText: 'Book',
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }
//                         },
//                       ),
//                     );
//                   });
//             }
//           } else if (state is GetRequestedAppoinmentsOfCustomerError) {
//             return const InternalServerErrorScreen();
//           }
//           return Container();
//         },
//       ),
//     );
//   }

//   SizedBox _shimmer(BuildContext context) {
//     return SizedBox(
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Shimmer.fromColors(
//           baseColor: Colors.grey[300]!,
//           highlightColor: Colors.grey[100]!,
//           child: ListView.builder(
//             itemBuilder: (_, __) => Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: SizedBox(
//                     height: 140,
//                     width: MediaQuery.of(context).size.width * 0.9,
//                   ),
//                 ),
//               ),
//             ),
//             itemCount: 4,
//           ),
//         ),
//       ),
//     );
//   }
// }
