// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';
// import '../../Core/helper/ReusedFunctions.dart';
// import '../../Data/Models/ServiceProviderModels/GetServiceProvidersModel.dart';
// import '../../Presentation/Screens/ErrorHandling/EmptyDataScreen.dart';
// import '../../Presentation/Screens/ErrorHandling/InternalServerErrorScreen.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../../Data/Models/ChatModels/CreateChatHeadModel.dart';
// import '../../../Data/Models/CheckOutModel/CheckOutModel.dart';
// import '../../../Data/Models/ServicesModels/GetAllServicesModel.dart';
// import '../../../Data/Models/TherapyType/TherapyTypeModel.dart';
// import '../../Bloc/CartBloc/cart_bloc.dart';
// import '../../Bloc/GetAllServicesBloc/get_all_services_bloc.dart';
// import '../../Widgets/FilterBottomSheet.dart';
// import '../../Widgets/MyButton.dart';
// // ignore_for_file: must_be_immutable
// import '../../../Core/helper/Constants.dart';
// import '../../../Presentation/Widgets/MyAppBar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../Widgets/StripeBottomSheet.dart';

// class ServiceProviderProfileScreen extends StatefulWidget {
//   static const routeName = '/profile';
//   ServiceProviderProfileScreen({required this.model, Key? key}) : super(key: key);
//   GetServiceProvidersModel model;
//   @override
//   State<ServiceProviderProfileScreen> createState() => _ServiceProviderProfileScreenState();
// }

// class _ServiceProviderProfileScreenState extends State<ServiceProviderProfileScreen> {
//   DateTime? filterdate, fromDate, toDate;
//   final searchController = TextEditingController();
//   TherapyTypeResponseModel? therapyTypeResponseModel;
//   @override
//   void initState() {
//     BlocProvider.of<GetAllServicesBloc>(context).add(GetAllServices());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<CartBloc, CartStateBase>(
//       listener: (context, state) {
//         if (state is CartLoading) {
//           Get.snackbar("Loading...", "Please wait");
//         } else if (state is CartSucess) {
//           Get.snackbar("Success", "Added to Cart!");
//         } else if (state is CartError) {
//           Get.snackbar("Opps", "Try Again");
//         }
//       },
//       child: Scaffold(
//         appBar: MyAppBar(
//             title: 'Profile',
//             isDrawer: false,
//             trailing: GestureDetector(
//               onTap: () => Get.bottomSheet(FilterServices(
//                 onDataReceived: (from, to, date, therapy) {
//                   fromDate = DateTime(
//                       date.year, date.month, date.day, from.hour, from.minute);
//                   toDate = DateTime(
//                       date.year, date.month, date.day, to.hour, to.minute);
//                   filterdate = date;
//                   therapyTypeResponseModel = therapy;
//                 },
//               )),
//               child: const Icon(
//                 Icons.filter_alt_rounded,
//                 size: 30,
//                 color: kBlueAccentColor,
//               ),
//             )),
//         body: ListView(
//           children: [
//             _serviceProviderInfo(widget.model.profilePicture!, widget.model.fullName!,
//                 widget.model.businessPhoneNumber!, widget.model.city!),
//             verticalSpacing20,
//             _serviceProviderServices(widget.model.fullName!),
//           ],
//         ),
//       ),
//     );
//   }

//   SizedBox _serviceProviderServices(String serviceProviderName) {
//     final int columnCount = getCount(MediaQuery.of(context).size.width);

//     return SizedBox(
//       height: Get.height * 0.6,
//       child: BlocBuilder<GetAllServicesBloc, GetAllServicesStateBase>(
//         builder: (context, state) {
//           if (state is GetAllServicesLoading) {
//             return _shimmer(context);
//           } else if (state is GetAllServicesLoaded) {
//             var list = state.filteredList == null
//                 ? state.model!.where((x) => x.serviceProviderName == serviceProviderName).toList()
//                 : state.filteredList!
//                     .where((x) => x.serviceProviderName == serviceProviderName)
//                     .toList();
//             if (list.length == 0) {
//               return EmptyDataScreen(text: 'No Services!');
//             } else {
//               return ListView.builder(
//                   itemCount: list.length,
//                   itemBuilder: (context, rowindex) {
//                     return Row(
//                       children: List.generate(
//                         columnCount,
//                         (columnindex) {
//                           final int index =
//                               rowindex * columnCount + columnindex;

//                           if (index >= list.length) {
//                             return Expanded(child: Container());
//                           }
//                           return Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: MyCard(
//                                   filterdate: filterdate,
//                                   fromDate: fromDate,
//                                   therapyTypeResponseModel:
//                                       therapyTypeResponseModel,
//                                   toDate: toDate,
//                                   model: list[index]),
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   });
//             }
//           } else if (state is GetAllServicesError) {
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

//   Widget _serviceProviderInfo(String serviceProviderProfile, String serviceProviderName,
//           String serviceProviderSpecialization, String serviceProviderAddress) =>
//       Container(
//         margin: const EdgeInsets.only(top: 15, left: 10),
//         padding: const EdgeInsets.only(left: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(2),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: kBlueAccentColor),
//               child: CircleAvatar(
//                 backgroundImage: NetworkImage(serviceProviderProfile),
//                 onBackgroundImageError: (exception, stackTrace) =>
//                     SvgPicture.asset('assets/Images/serviceProvider-male.svg'),
//                 radius: 50,
//                 backgroundColor: kBlueAccentColor,
//               ),
//             ),
//             horizontalSpacing20,
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   serviceProviderName,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 Container(
//                     padding: const EdgeInsets.only(
//                         top: 4, bottom: 4, left: 10, right: 10),
//                     margin: const EdgeInsets.only(top: 2, bottom: 2),
//                     decoration: BoxDecoration(
//                         color: Colors.green[100],
//                         borderRadius: BorderRadius.circular(5)),
//                     child: Text(
//                       serviceProviderSpecialization,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, color: kBlackColor),
//                     )),
//                 verticalSpacing10,
//                 Container(
//                   padding: const EdgeInsets.only(
//                       top: 4, bottom: 4, left: 5, right: 10),
//                   margin: const EdgeInsets.only(top: 2, bottom: 2),
//                   decoration: BoxDecoration(
//                       color: Colors.yellow[300],
//                       borderRadius: BorderRadius.circular(5)),
//                   child: Row(
//                     children: [
//                       const Icon(
//                         Icons.location_on_outlined,
//                         color: kBlackColor,
//                       ),
//                       Text(
//                         serviceProviderAddress,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, color: kBlackColor),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       );
// }

// class MyCard extends StatelessWidget {
//   MyCard(
//       {Key? key,
//       this.model,
//       required this.filterdate,
//       this.fromDate,
//       this.therapyTypeResponseModel,
//       this.toDate})
//       : super(key: key);
//   GetAllServiceModel? model;
//   DateTime? filterdate, fromDate, toDate;
//   TherapyTypeResponseModel? therapyTypeResponseModel;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         margin: const EdgeInsets.only(top: 15),
//         elevation: 10,
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ListTile(
//                 // leading: GestureDetector(
//                 //   onTap: () => Get.to(const ServiceProviderProfileScreen()),
//                 //   child: CircleAvatar(
//                 //     radius: 30,
//                 //     child:
//                 //         SvgPicture.asset('assets/Images/serviceProvider-male.svg'),
//                 //   ),
//                 // ),

//                 title: Text(
//                   model!.name ?? "",
//                   style: const TextStyle(
//                       fontSize: 17, fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(model!.therapyName ?? ""),
//                     Text('${model!.serviceProviderName}'),
//                     Text(
//                         '${model!.charges}\$  (${model!.numberOfTimesAvailable}) xTimes'),
//                   ],
//                 ),
//                 trailing: Text(DateFormat('dd-MM-yyyy')
//                     .format(DateTime.parse(model!.validTill!))),
//               ),
//               Container(
//                 alignment: Alignment.bottomRight,
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                   elevation: 5,
//                   child: MyButton(
//                     width: 120,
//                     textSize: 16,
//                     onPressed: () {
//                       Get.bottomSheet(StripePayemnt(
//                         createChatHeadModel:
//                             CreateChatHeadModel(uId: model!.serviceProviderId),
//                         model: CheckOutModel(
//                             appointmentTypeId: 2,
//                             date: filterdate!.toIso8601String(),
//                             endTime: toDate!.toIso8601String(),
//                             startTime: fromDate!.toIso8601String(),
//                             serviceId: model!.id),
//                         price: model?.charges.toString(),
//                       ));
//                     },
//                     fontColor: kWhiteColor,
//                     bgColor: kBlueAccentColor,
//                     buttonText: 'Book Now',
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ServiceProviderEducationWidget extends StatelessWidget {
//   ServiceProviderEducationWidget({
//     Key? key,
//     required this.serviceProviderEducation,
//   }) : super(key: key);
//   String serviceProviderEducation;
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: const Icon(
//         Icons.location_city,
//         color: kPrimaryColor,
//       ),
//       title: Text(
//         serviceProviderEducation,
//         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
//       ),
//     );
//   }
// }

// class SpecialitiesWidget extends StatelessWidget {
//   SpecialitiesWidget({Key? key, required this.text}) : super(key: key);
//   String text;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(5),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5), color: kPrimaryColor),
//       padding: const EdgeInsets.all(7),
//       child: Text(
//         text,
//         style: const TextStyle(fontWeight: FontWeight.w500, color: kWhiteColor),
//       ),
//     );
//   }
// }