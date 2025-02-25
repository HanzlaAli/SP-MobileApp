// ignore_for_file: must_be_immutable, file_names, prefer_typing_uninitialized_variables
import '../../../Presentation/Bloc/GetProfileBloc/get_profile_bloc.dart';
import '../../../Presentation/Widgets/ServiceProviderLicenseDetails.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Presentation/helper/Constants/Constants.dart';
import '../../../Presentation/Widgets/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Routes/Routes.dart';
import '../../Bloc/AddServiceProviderLicenseBloc/add_serviceProvider_license_bloc.dart';
import '../../Bloc/AddServiceProviderSpecializationBloc/add_serviceProvider_specialization_bloc.dart';
import '../../Bloc/AddServiceProviderTherapyBloc/add_serviceProvider_therapy_bloc.dart';
import '../../helper/Constants/MyColors.dart';
import '../../helper/Constants/MyIcons.dart';
import '../../helper/Constants/MySpaces.dart';
import '../../../Data/Models/ProfileModels/ServiceProviderProfileModel.dart';
import '../../Bloc/GetServiceProviderLicenseTypeBloc/get_serviceProvider_license_types_bloc.dart';
import '../../Bloc/GetServiceProviderSpecializationBloc/get_serviceProvider_specialization_bloc.dart';
import '../../Bloc/GetServiceProviderTherapyTypesBloc/get_therapy_types_bloc.dart';
import '../../Widgets/MyDrawer.dart';
import '../../Widgets/MyIconWithText.dart';
import 'EditProfile.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<GetProfileBloc>(context).add(GetServiceProviderProfileEvent());

    super.initState();
  }

  var serviceProvider;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddServiceProviderTherapyBloc, AddServiceProviderTherapyStateBase>(
      listener: (context, state) {
        if (state is AddServiceProviderTherapySuccess) {
          BlocProvider.of<GetProfileBloc>(context).add(GetServiceProviderProfileEvent());
        }
      },
      child: BlocListener<AddServiceProviderSpecializationBloc,
          AddServiceProviderSpecializationStateBase>(
        listener: (context, state) {
          if (state is AddServiceProviderSpecializationSuccess) {
            BlocProvider.of<GetProfileBloc>(context)
                .add(GetServiceProviderProfileEvent());
          }
        },
        child: BlocListener<AddServiceProviderLicenseBloc, AddServiceProviderLicenseStateBase>(
          listener: (context, state) {
            if (state is AddServiceProviderLicenseSuccess) {
              BlocProvider.of<GetProfileBloc>(context)
                  .add(GetServiceProviderProfileEvent());
            }
          },
          child: Scaffold(
            drawer: const MyDrawer(),
            appBar: MyAppBar(
              trailing: GestureDetector(
                onTap: () {
                  navigatorPush(
                      context,
                      EditProfile(
                        serviceProviderProfileModel: serviceProvider,
                      ));
                  BlocProvider.of<GetServiceProviderLicenseTypesBloc>(context)
                      .add(const GetServiceProviderLicenseTypesEvent());

                  BlocProvider.of<GetServiceProviderSpecializationBloc>(context)
                      .add(const GetServiceProviderSpecializationEvent());

                  BlocProvider.of<GetTherapyTypesBloc>(context)
                      .add(const GetTherapyTypesEvent());
                },
                child: Container(
                    height: 50,
                    width: 50,
                    child: const Icon(
                      Icons.edit,
                      color: kPrimaryColor,
                    )),
              ),
              title: 'My Profile',
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<GetProfileBloc>(context)
                    .add(GetServiceProviderProfileEvent());
              },
              child: BlocBuilder<GetProfileBloc, GetProfileStateBase>(
                builder: (context, state) {
                  if (state is GetProfileLoading) {
                    return kCircularProgressIndicator;
                  } else if (state is GetProfileLoaded) {
                    serviceProvider = state.serviceProviderProfileModel;
                    return SizedBox(
                      width: Get.width * 0.9,
                      child: ListView(
                        children: [
                          _serviceProviderInfo(
                              serviceProvider!.profilePicture ?? "",
                              "${serviceProvider.user!.firstName} ${serviceProvider.user!.lastName!}",
                              serviceProvider.user!.phoneNumber!,
                              serviceProvider.streetAddress!),
                          verticalSpacing20,
                          _professionalProfile(serviceProvider.bio!),
                          verticalSpacing20,
                          serviceProvider.specializations!.length > 0
                              ? _specialities(serviceProvider.specializations!)
                              : const SizedBox(
                                  height: 1,
                                  width: 1,
                                ),
                          verticalSpacing20,
                          serviceProvider.qualifications!.length == 0
                              ? const SizedBox(
                                  height: 1,
                                  width: 1,
                                )
                              : _qualification(serviceProvider.qualifications!),
                          verticalSpacing20,
                          serviceProvider.serviceProviderLicense == null
                              ? const SizedBox(
                                  height: 1,
                                  width: 1,
                                )
                              : _licenses(serviceProvider.serviceProviderLicense!),
                          verticalSpacing20,
                          serviceProvider.serviceProviderTherapies!.length == 0
                              ? const SizedBox(
                                  height: 1,
                                  width: 1,
                                )
                              : _therapies(serviceProvider.serviceProviderTherapies!),
                          verticalSpacing20,
                          verticalSpacing20,
                        ],
                      ),
                    );
                  } else if (state is GetProfileError) {
                    return const Center(
                      child: Text('Something went wrong!'),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _serviceProviderInfo(String serviceProviderProfile, String serviceProviderName,
          String serviceProviderSpecialization, String serviceProviderAddress) =>
      Container(
        margin: const EdgeInsets.only(top: 15, left: 10),
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kBlueAccentColor),
              child: CircleAvatar(
                backgroundImage: NetworkImage(serviceProviderProfile),
                onBackgroundImageError: (exception, stackTrace) =>
                    byDefaultImage,
                radius: 50,
                backgroundColor: kBlueAccentColor,
              ),
            ),
            horizontalSpacing20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serviceProviderName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(
                        top: 4, bottom: 4, left: 10, right: 10),
                    margin: const EdgeInsets.only(top: 2, bottom: 2),
                    decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      serviceProviderSpecialization,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: kBlackColor),
                    )),
                verticalSpacing10,
                Container(
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 4, left: 5, right: 10),
                  margin: const EdgeInsets.only(top: 2, bottom: 2),
                  decoration: BoxDecoration(
                      color: Colors.yellow[300],
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: kBlackColor,
                      ),
                      Text(
                        serviceProviderAddress,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: kBlackColor),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );

  Widget _professionalProfile(String serviceProviderInfo) => Container(
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: kWhiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyIconWithText(text: 'Bio'),
            verticalSpacing10,
            Text(
              serviceProviderInfo,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );

  Widget _specialities(List<Specializations> specializations) => Container(
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: kWhiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyIconWithText(text: 'Specialities'),
            verticalSpacing10,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: specializations
                  .map(
                    (specialization) =>
                        SpecialitiesWidget(text: specialization.name ?? ""),
                  )
                  .toList(),
            ),
          ],
        ),
      );

  // Widget _awards() => Container(
  Widget _qualification(List<Qualifications> qualification) => Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: kWhiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyIconWithText(text: 'Education'),
            verticalSpacing10,
            Expanded(
              child: ListView.builder(
                  itemCount: qualification.length,
                  itemBuilder: (context, index) => ServiceProviderEducationWidget(
                      serviceProviderEducation: qualification[index].institutionName!)),
            ),
          ],
        ),
      );

  Widget _licenses(ServiceProviderLicense serviceProviderLicenses) => GestureDetector(
        onTap: () =>
            Get.dialog(ServiceProviderLicenseDetails(serviceProviderLicense: serviceProviderLicenses)),
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: kWhiteColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyIconWithText(text: 'License'),
              verticalSpacing10,
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    color: kPrimaryColor,
                  ),
                  horizontalSpacing20,
                  SizedBox(
                    width: 255,
                    child: Text(
                      '${serviceProviderLicenses.licenseType!.name}',
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Widget _therapies(List<ServiceProviderTherapies> serviceProviderTherapies) => Container(
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: kWhiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyIconWithText(text: 'Service Types'),
            verticalSpacing10,
            SizedBox(
              height: 30 * serviceProviderTherapies.length.toDouble(),
              child: ListView.builder(
                  itemCount: serviceProviderTherapies.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        const Icon(
                          Icons.check_outlined,
                          color: kPrimaryColor,
                        ),
                        horizontalSpacing20,
                        SizedBox(
                          width: 255,
                          child: Text(
                            '${serviceProviderTherapies[index].therapyName}',
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      );
}

class ServiceProviderEducationWidget extends StatelessWidget {
  ServiceProviderEducationWidget({
    Key? key,
    required this.serviceProviderEducation,
  }) : super(key: key);
  String serviceProviderEducation;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.school,
        color: kPrimaryColor,
      ),
      title: Text(
        serviceProviderEducation,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }
}

class SpecialitiesWidget extends StatelessWidget {
  SpecialitiesWidget({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: kPrimaryColor),
      padding: const EdgeInsets.all(7),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500, color: kWhiteColor),
      ),
    );
  }
}
