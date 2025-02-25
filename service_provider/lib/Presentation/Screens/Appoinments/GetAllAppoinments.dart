// ignore_for_file: file_names, unnecessary_null_comparison
import 'dart:math';
import 'package:permission_handler/permission_handler.dart';

import '../../../Core/Routes/Routes.dart';
import '../../../Presentation/helper/Constants/MyColors.dart';
import '../../../Data/Models/AppoinmentModels/GetAppoinmentRequestModel.dart';
import '../../../Data/Models/AppointmentRoomModel/CreateAppointmentRoomModel.dart';
import '../../../Presentation/Bloc/GetServiceProviderAppoinments/get_serviceProvider_appoinments_bloc.dart';
import '../../../Presentation/Bloc/GetProfileBloc/get_profile_bloc.dart';
import '../../../Presentation/Screens/VideoCalling/VideoCalling.dart';
import '../../../Presentation/Widgets/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../Data/Models/AppoinmentModels/GetServiceProviderAppoinmentsModel.dart';
import '../../../Data/Models/AppoinmentModels/MeetingModel.dart';
import '../../../Data/Models/PushNotificationModel/VideoCallPushNotificationModel.dart';
import '../../Bloc/AppointmentRoom/appointment_room_bloc.dart';
import '../../Bloc/PushNotificationBloc/push_notification_bloc.dart';
import '../../Bloc/ThemeBloc/theme_bloc.dart';
import '../../Widgets/MyDrawer.dart';
import '../../../Data/Models/PushNotificationModel/NotificationModel.dart'
    as notification;

class AppoinmentsScreen extends StatefulWidget {
  static const routeName = '/appoinments';
  AppoinmentsScreen({super.key, required this.fromDrawer});
  bool fromDrawer;
  @override
  State<AppoinmentsScreen> createState() => _AppoinmentsScreenState();
}

class _AppoinmentsScreenState extends State<AppoinmentsScreen> {
  @override
  void initState() {
    ftoast.init(context);

    BlocProvider.of<GetServiceProviderAppoinmentsBloc>(context).add(GetServiceProviderAppoinments(
        model: GetBookedAppoinmentRequestModel(
            fromDate: DateTime.now().toIso8601String(),
            email: "",
            toDate: DateTime.now()
                .add(const Duration(days: 10))
                .toIso8601String())));
    super.initState();
  }

  FToast ftoast = FToast();
  void showToast(String msg) {
    ftoast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: kBlackColor45,
        ),
        child: Text(
          msg,
          style: const TextStyle(color: kWhiteColor),
        ),
      ),
    );
  }

  List<Meeting> _getDataSource(List<GetServiceProviderAppoinmentsModel> list) {
    final List<Meeting> meetings = <Meeting>[];
    for (var event in list) {
      meetings.add(Meeting(
          event.id!,
          "Appointment with ${event.customerName!}",
          DateTime.parse(event.startTime!),
          DateTime.parse(event.endTime!),
          Colors.red,
          false,
          event.customerId!));
    }
    return meetings;
  }

  Future<void> handelPermission() async {
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    await permission.request();
  }

  void sendNotification(Data data) {
    GetProfileLoaded? profileLoaded;
    GetProfileStateBase state = BlocProvider.of<GetProfileBloc>(context).state;
    if (state is GetProfileLoaded) {
      profileLoaded = state;
    }
    String name =
        ("${profileLoaded!.serviceProviderProfileModel!.user!.firstName} ${profileLoaded.serviceProviderProfileModel!.user!.lastName}");
    data.joindUserProfilePicture =
        profileLoaded.serviceProviderProfileModel!.profilePicture;
    BlocProvider.of<PushNotificationBloc>(context)
        .add(SendVideoCallJoiningNotification(
            model: VideoCallPushNotificationModel(
      data: data,
      notification: notification.Notification(
        body: "$name just joined call!",
        title: name,
      ),
    )));
  }

  List<GetServiceProviderAppoinmentsModel>? model = [];
  Future _appointmentBookedPopUp(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Icon(
              Icons.warning,
              color: Colors.red,
            ),
            content: const Text("No Appointemnt exist on this time"),
            actions: <Widget>[
              // ElevatedButton(
              //   style: ButtonStyle(
              //       backgroundColor:
              //           MaterialStateProperty.all<Color>(kPrimaryColor)),
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   child: const Text('Yes'),
              // ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () => Navigator.pop(context),
                child: const Text('No'),
              ),
            ],
          );
        },
      );
  DateTime? prevDate;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AppointmentRoomBloc, AppointmentRoomState>(
      listener: (context, state) {
        if (state is AppointmentRoomCreated) {
          var data = Data(
            appointmentId: state.model!.appointmentId,
            customerId: state.model!.customerId,
            serviceProviderId: state.model!.serviceProviderId,
            serviceProviderName: state.model!.serviceProviderName,
            notificationType: "call",
            customerName: state.model!.customerName,
          );
          sendNotification(data);

          // navigatorPush(
          //     context,
          //     VideoCallScreen(
          //       model: state.model,
          //     ));
        } else if (state is AppointmentRoomError) {
          if (state.model?.code == 503) {
            showToast(state.model!.message!);
          }
        }
      },
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themestate) {
          return Scaffold(
            drawer: const MyDrawer(),
            appBar: MyAppBar(
              isDrawer: widget.fromDrawer,
              title: 'Appoinments',
            ),
            body: BlocListener<GetServiceProviderAppoinmentsBloc,
                GetServiceProviderAppoinmentsStateBase>(
              listener: (context, state) {
                if (state is GetServiceProviderAppoinmentsLoaded) {
                  model = state.model;
                  setState(() {});
                }
              },
              child: SfCalendar(
                minDate: DateTime.now(),
                todayHighlightColor: themestate is DarkThemeState
                    ? kBlackColor
                    : kPrimaryColor,
                onViewChanged: (viewChangedDetails) {
                  if (prevDate == null ||
                      prevDate != viewChangedDetails.visibleDates.first) {
                    prevDate = viewChangedDetails.visibleDates.first;
                    BlocProvider.of<GetServiceProviderAppoinmentsBloc>(context).add(
                        GetServiceProviderAppoinments(
                            model: GetBookedAppoinmentRequestModel(
                                fromDate: viewChangedDetails.visibleDates.first
                                    .toIso8601String(),
                                toDate: viewChangedDetails.visibleDates.last
                                    .toIso8601String(),
                                email: "")));
                  }
                },
                // onSelectionChanged: (calendarSelectionDetails) {
                //   print("abc");
                // },
                onTap: (CalendarTapDetails val) {
                  handelPermission();
                  //    navigatorPush(context, VideoCallScreen());
                  const chars =
                      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
                  Random rnd = Random();

                  String getRandomString(int length) =>
                      String.fromCharCodes(Iterable.generate(length,
                          (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
                  if (val.appointments != null && model != null) {
                    GetServiceProviderAppoinmentsModel getServiceProviderAppoinmentsModel = model!
                        .singleWhere((x) => x.id == val.appointments?[0].id);
                    var name = getServiceProviderAppoinmentsModel.id.toString() +
                        getRandomString(5);
                    if (getServiceProviderAppoinmentsModel != null) {
                      BlocProvider.of<AppointmentRoomBloc>(context).add(
                        AddAppointmentRoom(
                          customerId: val.appointments?[0].customerId.toString(),
                          model: CreateAppointmentRoomModel(
                            appointmentRoomRequest: AppointmentRoomRequest(
                                appointmentId: getServiceProviderAppoinmentsModel.id,
                                roomName: name,
                                rtcToken: ""),
                          ),
                        ),
                      );
                    } else {
                      _appointmentBookedPopUp(context);
                    }
                  } else {
                    _appointmentBookedPopUp(context);
                  }
                },
                dataSource: MeetingDataSource(_getDataSource(model!)),
                view: CalendarView.day,
                allowedViews: const [
                  CalendarView.day,
                  CalendarView.week,
                  CalendarView.month,
                ],
                firstDayOfWeek: 1,
              ),
            ),
          );
        },
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
