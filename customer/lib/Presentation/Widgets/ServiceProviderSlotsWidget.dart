import 'package:get/get.dart';

import '../../Presentation/Widgets/StripeBottomSheet.dart';
import '../../Presentation/helper/ReusedFunctions.dart';
import '../../Data/Models/ChatModels/CreateChatHeadModel.dart';
import '../../Data/Models/ServiceProviderAvailabilityModel/ServiceProviderAvailabilityModel.dart';
import '../Bloc/GetAppointmnetByServiceProviderBloc/get_appointment_by_serviceProvider_bloc.dart';
import '../Bloc/ServiceProviderAvailability/serviceProvider_availability_bloc.dart';
import '../helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../Core/Routes/Routes.dart';
import '../../Data/Models/AppoinmentModels/CreateAppoinmentModel.dart';
import '../../Data/Models/AppoinmentModels/GetServiceProviderAppointmentResponseModel.dart';
import '../../Data/Models/AppoinmentModels/GetServiceProviderAppointmentsRequestModel.dart';
import '../Bloc/CreateAppoinmentBloc/create_appoinment_bloc.dart';

import '../Screens/Appoinments/GetAllAppoinments.dart';

class ServiceProviderSlotsWidget extends StatefulWidget {
  static const routeName = '/slots';
  ServiceProviderSlotsWidget(
      {super.key,
      required this.firstTime,
      required this.serviceProviderId,
      this.serviceId,
      this.price,
      this.CustomerServiceId});
  int? serviceProviderId, CustomerServiceId, CustomerId, serviceId;
  String? price;
  bool firstTime;

  @override
  State<ServiceProviderSlotsWidget> createState() => _ServiceProviderSlotsWidgetState();
}

class _ServiceProviderSlotsWidgetState extends State<ServiceProviderSlotsWidget> {
  List<GetServiceProviderAppointmentsResponseModel>? model = [];

  List<ServiceProviderAvailabilityModel>? serviceProviderAvailabilities = [];

  @override
  void initState() {
    BlocProvider.of<GetAppointmentByServiceProviderBloc>(context).add(
        GetAppointmentsOfServiceProvider(
            model: GetServiceProviderAppointments(
                date: DateTime.now().toIso8601String(),
                serviceProviderId: widget.serviceProviderId)));
    BlocProvider.of<ServiceProviderAvailabilityBloc>(context).add(
        GetServiceProviderAvailabilityEvent(
            serviceProviderId: widget.serviceProviderId!, weekDay: DateTime.now().weekday));
    super.initState();
  }

  List<Meeting> _getAvailableSlots(
      List<ServiceProviderAvailabilityModel> serviceProviderAvailability) {
    // Define the serviceProvider's available time slots for the given date
    List<Meeting> availableSlots = [];
    for (var availability in serviceProviderAvailability) {
      var presentdate = prevDate ?? DateTime.now();

      ///Splitting start time
      List<int> startTimeSplit =
          availability.startTime!.split(':').map(int.parse).toList();

      DateTime startTime = DateTime(presentdate.year, presentdate.month,
          presentdate.day, startTimeSplit[0], startTimeSplit[1]);

      ///Splitting end time
      List<int> endTimeSplit =
          availability.endTime!.split(':').map(int.parse).toList();

      DateTime endTime = DateTime(presentdate.year, presentdate.month,
          presentdate.day, endTimeSplit[0], endTimeSplit[1]);
      var docAvailability = Meeting(
        availability.id!,
        "Slot available ${dateTimetoTimeConverter(startTime)} - ${dateTimetoTimeConverter(endTime)}",
        startTime,
        endTime,
        Colors.greenAccent,
        false,
      );
      availableSlots.add(docAvailability);
    }
    return availableSlots;
  }

  List<Meeting> _getDataSource(List<GetServiceProviderAppointmentsResponseModel> list,
      List<ServiceProviderAvailabilityModel> serviceProviderAvailability) {
    final List<Meeting> meetings = <Meeting>[];
    // Add booked appointments to the meetings list
    for (var event in list) {
      meetings.add(
        Meeting(event.id!, "Slot Booked", DateTime.parse(event.startTime!),
            DateTime.parse(event.endTime!), Colors.red, false),
      );
    }
    var availabilities = _getAvailableSlots(serviceProviderAvailability);

    var filteredAvailabilities = availabilities
        .where(
          (availability) => !meetings.any((x) =>
              x.from.compareTo(availability.from) >= 0 &&
              x.to.compareTo(availability.to) >= 0),
        )
        .toList();
    // Add available slots to the meetings list
    meetings.addAll(filteredAvailabilities);
    return meetings;
  }

  Future _appointmentBookedPopUp(BuildContext context, String text) =>
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Icon(
              Icons.warning,
              color: Colors.red,
            ),
            content: Text(text),
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
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
  Future _confirmAppointment(BuildContext context, DateTime date,
          DateTime startTime, DateTime endTime) =>
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Confirm"),
            content: Text(
                "Are you sure you want an appointment from ${dateTimetoTimeConverter(startTime)} to ${dateTimetoTimeConverter(endTime)} on ${dateTimetoDateConverter(date)}"),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () {
                  if (widget.firstTime) {
                    Navigator.pop(context);
                    Navigator.pop(context);

                    Get.bottomSheet(StripePayemnt(
                      createChatHeadModel: CreateChatHeadModel(
                        uId: widget.serviceProviderId,
                      ),
                      serviceProviderId: widget.serviceProviderId,
                      serviceId: widget.serviceId,
                      price: widget.price,
                      date: date,
                      endTime: endTime,
                      startTime: startTime,
                    ));
                  } else {
                    BlocProvider.of<CreateAppoinmentBloc>(context)
                        .add(CreateAppoinment(
                      model: CreateAppoinmentModel(
                        appointmentTypeId: 2,
                        date: date.toIso8601String(),
                        endTime: endTime.toIso8601String(),
                        startTime: startTime.toIso8601String(),
                        CustomerServiceId: widget.CustomerServiceId,
                      ),
                    ));
                    Navigator.pop(context);
                  }
                },
                child: const Text('Yes'),
              ),
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
    return BlocListener<CreateAppoinmentBloc, CreateAppoinmentStateBase>(
      listener: (context, state) {
        if (state is CreateAppoinmentLoading) {
          Get.snackbar("Loading...", "Please wait");
        } else if (state is CreateAppoinmentSuccess) {
          Get.snackbar("Success", "Appoinment Booked!");
          navigatorPush(context, const AppoinmentsScreen());
        } else if (state is CreateAppoinmentError) {
          Get.snackbar("Opps", "Try Again");
        }
      },
      child: Scaffold(
        body: BlocListener<ServiceProviderAvailabilityBloc, ServiceProviderAvailabilityState>(
          listener: (context, state) {
            if (state is ServiceProviderAvailabilityLoaded) {
              serviceProviderAvailabilities = state.list;
              setState(() {});
            } else {
              serviceProviderAvailabilities = [];
              setState(() {});
            }
          },
          child: BlocListener<GetAppointmentByServiceProviderBloc,
              GetAppointmentByServiceProviderState>(
            listener: (context, state) {
              if (state is GetAppointmentByServiceProviderLoaded) {
                model = state.model;
                setState(() {});
              }
            },
            child: SfCalendar(
              minDate: DateTime.now(),
              onViewChanged: (ViewChangedDetails viewChangedDetails) {
                if (prevDate == null ||
                    prevDate != viewChangedDetails.visibleDates.first) {
                  prevDate = viewChangedDetails.visibleDates.first;
                  int weekDay =
                      weekDays(viewChangedDetails.visibleDates.first.weekday);
                  BlocProvider.of<GetAppointmentByServiceProviderBloc>(context).add(
                      GetAppointmentsOfServiceProvider(
                          model: GetServiceProviderAppointments(
                              date: viewChangedDetails.visibleDates.first
                                  .toIso8601String(),
                              serviceProviderId: widget.serviceProviderId)));
                  BlocProvider.of<ServiceProviderAvailabilityBloc>(context).add(
                      GetServiceProviderAvailabilityEvent(
                          serviceProviderId: widget.serviceProviderId!, weekDay: weekDay));
                }
              },
              onTap: (calendarTapDetails) {
                var event = calendarTapDetails.appointments?[0].eventName;
                if (event.toString().contains("Slot available")) {
                  _confirmAppointment(
                      context,
                      calendarTapDetails.date!,
                      calendarTapDetails.appointments?[0].from,
                      calendarTapDetails.appointments?[0].to);
                } else {
                  if (calendarTapDetails.appointments == null) {
                    _appointmentBookedPopUp(
                        context, "Service Provider is not available at this time");
                  } else {
                    _appointmentBookedPopUp(
                        context, "Appointment already exists!");
                  }
                }
              },
              dataSource: model == null
                  ? null
                  : MeetingDataSource(
                      _getDataSource(model!, serviceProviderAvailabilities!)),
              view: CalendarView.day,
              firstDayOfWeek: 1,
            ),
          ),
        ),
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

class Meeting {
  Meeting(this.id, this.eventName, this.from, this.to, this.background,
      this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  int id;
}
