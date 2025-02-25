
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../Presentation/Bloc/AppointmentRoom/appointment_room_bloc.dart';
import '../../../Presentation/Screens/VideoCalling/VideoCalling.dart';
import '../../../Core/Routes/Routes.dart';
import '../../helper/Constants.dart';
import '../../../Data/Models/AppoinmentModels/GetAppoinmentRequestModel.dart';
import '../../../Data/Models/AppoinmentModels/GetServiceProviderAppoinmentsModel.dart';
import '../../../Data/Models/PushNotificationModel/VideoCallPushNotificationModel.dart';
import '../../../Data/Models/PushNotificationModel/NotificationModel.dart'
    as notification;
import '../../../Presentation/Bloc/GetServiceProviderAppoinments/get_serviceProvider_appoinments_bloc.dart';
import '../../../Presentation/Widgets/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../Bloc/GetUserProfileBloc/get_user_profile_bloc.dart';
import '../../Bloc/PushNotificationBloc/push_notification_bloc.dart';
import '../../Widgets/MyDrawer.dart';

class AppoinmentsScreen extends StatefulWidget {
  static const routeName = '/appoinments';
  const AppoinmentsScreen({super.key});

  @override
  State<AppoinmentsScreen> createState() => _AppoinmentsScreenState();
}

class _AppoinmentsScreenState extends State<AppoinmentsScreen> {
  @override
  void initState() {
    ftoast.init(context);
    BlocProvider.of<GetCustomerAppoinmentsBloc>(context).add(
        GetServiceProviderAppoinments(
            model: GetBookedAppoinmentRequestModel(
                fromDate: DateTime.now().toIso8601String(),
                toDate: DateTime.now().toIso8601String(),
                email: "")));
    super.initState();
  }

  Future<void> handelPermission() async {
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    await permission.request();
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

  List<Meeting> _getDataSource(List<GetCustomerAppoinmentsModel> list) {
    final List<Meeting> meetings = <Meeting>[];
    for (var event in list) {
      meetings.add(Meeting(
          event.id!,
          "Appointment with ${event.CustomerName!}",
          DateTime.parse(event.startTime!),
          DateTime.parse(event.endTime!),
          Colors.red,
          false,
          event.serviceProviderId!));
    }
    return meetings;
  }

  List<GetCustomerAppoinmentsModel>? model = [];
  DateTime? prevDate;
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
                child: const Text('Back'),
              ),
            ],
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<GetCustomerAppoinmentsBloc>(context).add(
            GetServiceProviderAppoinments(
                model: GetBookedAppoinmentRequestModel(
                    fromDate: DateTime.now().toIso8601String(),
                    toDate: DateTime.now().toIso8601String(),
                    email: "")));
      },
      child: BlocListener<AppointmentRoomBloc, AppointmentRoomState>(
        listener: (context, state) {
          if (state is AppointmentRoomSuccess) {
            var data = Data(
              appointmentId: state.model!.appointmentId,
              serviceProviderId: state.model!.serviceProviderId,
              serviceProviderName: state.model!.serviceProviderName,
              notificationType: "call",
              CustomerName: state.model!.CustomerName,
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
        child: Scaffold(
          appBar: MyAppBar(
            title: 'Appoinments',
            isDrawer: true,
          ),
          drawer: const MyDrawer(),
          body: BlocListener<GetCustomerAppoinmentsBloc,
              GetServiceProviderAppoinmentsStateBase>(
            listener: (context, state) {
              if (state is GetServiceProviderAppoinmentsLoaded) {
                model = state.model;
                setState(() {});
              }
            },
            child: SfCalendar(
              minDate: DateTime.now(),
              onViewChanged: (viewChangedDetails) {
                if (prevDate == null ||
                    prevDate != viewChangedDetails.visibleDates.first) {
                  prevDate = viewChangedDetails.visibleDates.first;
                  BlocProvider.of<GetCustomerAppoinmentsBloc>(context).add(
                      GetServiceProviderAppoinments(
                          model: GetBookedAppoinmentRequestModel(
                              fromDate: viewChangedDetails.visibleDates.first
                                  .toIso8601String(),
                              toDate: viewChangedDetails.visibleDates.last
                                  .toIso8601String(),
                              email: "")));
                }
              },
              onTap: (calendarTapDetails) {
                handelPermission();
                if (model != null) {
                  if (calendarTapDetails.appointments != null &&
                      calendarTapDetails.appointments!.length > 0 &&
                      calendarTapDetails.appointments![0] != null) {
                    BlocProvider.of<AppointmentRoomBloc>(context).add(
                        GetAppointMentRoomByAppointmentId(
                            serviceProviderId:
                                calendarTapDetails.appointments![0].serviceProviderId,
                            id: calendarTapDetails.appointments![0].id));
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
        ),
      ),
    );
  }

  void sendNotification(Data data) {
    GetUserProfileLoaded? profileLoaded;
    GetUserProfileStateBase state =
        BlocProvider.of<GetUserProfileBloc>(context).state;
    if (state is GetUserProfileLoaded) {
      profileLoaded = state;
    }
    String name =
        ("${profileLoaded!.customerProfileModel!.user!.firstName} ${profileLoaded.customerProfileModel!.user!.lastName}");
    data.joindUserProfilePicture =
        profileLoaded.customerProfileModel!.profilePicture;
    BlocProvider.of<PushNotificationBloc>(context)
        .add(SendVideoCallJoiningNotification(
            model: VideoCallPushNotificationModel(
      data: data,
      notification: notification.Notification(
        body: "User Joined!",
        title: name,
      ),
    )));
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

class Meeting {
  Meeting(this.id, this.eventName, this.from, this.to, this.background,
      this.isAllDay, this.serviceProviderId);

  String eventName;
  int serviceProviderId;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  int id;
}
