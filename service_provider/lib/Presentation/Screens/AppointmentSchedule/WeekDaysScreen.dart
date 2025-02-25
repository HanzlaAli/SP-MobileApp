import '../../../Core/Routes/Routes.dart';
import '../../../Presentation/Bloc/ServiceProviderAvailability/serviceProvider_availability_bloc.dart';
import '../../../Presentation/Screens/AppointmentSchedule/EditSlotsScreen.dart';
import '../../../Presentation/Screens/User/LogIn/LogIn.dart';
import '../../../Presentation/Widgets/MyAppBarWidget.dart';
import '../../../Presentation/Widgets/MyButton.dart';
import '../../../Presentation/helper/Constants/MyColors.dart';
import '../../../Presentation/helper/Constants/MySpaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Data/Models/ServiceProviderAvailabilityModel/GetServiceProviderAvailabilityModel.dart';
import '../../helper/ReusedFunctions.dart';
import '../ErrorHandling/InternalServerErrorScreen.dart';

class WeekDayScreen extends StatefulWidget {
  WeekDayScreen({super.key, required this.isNew});

  /// If user has new login then it will be true to show a button for submission
  bool isNew;
  @override
  State<WeekDayScreen> createState() => _WeekDayScreenState();
}

class _WeekDayScreenState extends State<WeekDayScreen> {
  final List daysOfWeek = [
    {"day": 'Sunday', "weekDay": 0},
    {"day": 'Monday', "weekDay": 1},
    {"day": 'Tuesday', "weekDay": 2},
    {"day": 'Wednesday', "weekDay": 3},
    {"day": 'Thurusday', "weekDay": 4},
    {"day": 'Friday', "weekDay": 5},
    {"day": 'Saturday', "weekDay": 6},
  ];

  @override
  void initState() {
    BlocProvider.of<ServiceProviderAvailabilityBloc>(context)
        .add(GetServiceProviderAvailabilityEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int columnCount = getCount(MediaQuery.of(context).size.width);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ServiceProviderAvailabilityBloc, ServiceProviderAvailabilityState>(
          builder: (context, state) {
            if (state is ServiceProviderAvailabilityLoading) {
              return _shimmer(context);
            } else if (state is ServiceProviderAvailabilityLoaded) {
              return Column(
                children: [
                  _appIcon(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: daysOfWeek.length,
                      padding: const EdgeInsets.all(16.0),
                      itemBuilder: (context, rowIndex) {
                        return Row(
                          children: List.generate(
                            columnCount,
                            (columnindex) {
                              final int index =
                                  rowIndex * columnCount + columnindex;
                              if (index >= daysOfWeek.length) {
                                return Expanded(child: Container());
                              } else {
                                return Expanded(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    elevation: 10,
                                    child: buildTimeSlotContainer(
                                        context,
                                        daysOfWeek[index]["day"],
                                        daysOfWeek[index]["weekDay"],
                                        state.list == null
                                            ? []
                                            : state.list!
                                                .where(
                                                  (x) =>
                                                      x.dayOfWeek ==
                                                      daysOfWeek[index]
                                                          ["weekDay"],
                                                )
                                                .toList()),
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  verticalSpacing10,

                  ///if is new is true then button will be shown
                  widget.isNew
                      ? MyButton(
                          onPressed: () {
                            Get.snackbar("Profile Completed!",
                                'Your profile is completed successfully. Please wait for admin to approve it');
                            navigatorPushAndRemoveUntil(
                                context, const LogInScreen());
                          },
                          fontColor: kWhiteColor,
                          buttonText: "Submit",
                        )
                      : const SizedBox(),
                  verticalSpacing10,
                ],
              );
            } else if (state is ServiceProviderAvailabilityError) {
              return const Center(
                child: InternalServerErrorScreen(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget buildTimeSlotContainer(
    BuildContext context,
    String day,
    int weekDay,
    List<GetServiceProviderAvailabilityModel> list,
  ) {
    return GestureDetector(
      onTap: () {
        navigatorPush(
            context,
            EditSlotsScreen(
              day: day,
              weekDay: weekDay,
              list: list,
            ));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: list.length == 1
            ? 65.0
            : 48.0 * (list.length == 0 ? 1 : list.length),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacing10,
            Text(
              day,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30.0 * (list.length),
                  child: ListView.separated(
                    itemCount: list.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) => Text(
                      '${list[index].startTime!} - ${list[index].endTime!}',
                      style: const TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox _shimmer(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[350]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
              ),
            ),
            itemCount: 4,
          ),
        ),
      ),
    );
  }

  Widget _appIcon() => MyAppBarWidget(
        pageNo: 'Schedule your timing\'s',
        text: "Add Your Timings",
      );
}
