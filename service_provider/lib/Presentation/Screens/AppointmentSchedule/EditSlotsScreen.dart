import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:mended_soluctions/Presentation/Widgets/MyButton.dart';
import '../../../Presentation/Widgets/MyAppBar.dart';
import '../../../Presentation/Widgets/MyTextButton.dart';
import '../../../Presentation/Widgets/MyTextFieldWithNoLogo.dart';
import '../../../Presentation/helper/Constants/MyColors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import '../../../Data/Models/ServiceProviderAvailabilityModel/CreateServiceProviderAvailabilityModel.dart';
import '../../../Data/Models/ServiceProviderAvailabilityModel/UpdateServiceProviderAvailabilityModel.dart'
    as updateAvailability;
import '../../../Data/Models/ServiceProviderAvailabilityModel/GetServiceProviderAvailabilityModel.dart';
import '../../Bloc/ServiceProviderAvailability/serviceProvider_availability_bloc.dart';
import '../../helper/Constants/MySpaces.dart';
import '../../helper/Constants/MyTextFieldsStyling.dart';
import '../../helper/ReusedFunctions.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart'
//     as dt_picker;

class EditSlotsScreen extends StatefulWidget {
  EditSlotsScreen({
    super.key,
    required this.day,
    required this.weekDay,
    required this.list,
  });
  String day;
  int weekDay;
  List<GetServiceProviderAvailabilityModel> list;
  @override
  State<EditSlotsScreen> createState() => _EditSlotsScreenState();
}

class _EditSlotsScreenState extends State<EditSlotsScreen> {
  List<TextEditingController> fromController = [];

  List<TextEditingController> toController = [];

  List<BuildTimeSlotContainer> columns = [];

  List<int> ids = [];

  void existingSlots() {
    for (var data in widget.list) {
      ids.add(data.id!);
      fromController.add(TextEditingController());
      toController.add(TextEditingController());
      fromController.last.text = data.startTime.toString();
      toController.last.text = data.endTime.toString();
      columns.add(BuildTimeSlotContainer(
        onDelete: () {
          if (columns.length > 0) {
            setState(() {
              columns.removeLast();
            });
          }
        },
        fromController: fromController.last,
        toController: toController.last,
      ));
    }
  }

  void addSlots(int len) {
    if (columns.length < len) {
      fromController.add(TextEditingController());
      toController.add(TextEditingController());
      columns.add(BuildTimeSlotContainer(
        onDelete: () {
          if (columns.length > 0) {
            setState(() {
              columns.removeLast();
            });
          }
        },
        fromController: fromController.last,
        toController: toController.last,
      ));
      setState(() {});
    }
  }

  @override
  void initState() {
    if (widget.list.isNotEmpty) {
      existingSlots();
    }
    addSlots(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServiceProviderAvailabilityBloc,
        ServiceProviderAvailabilityState>(
      listener: (context, state) {
        if (state is ServiceProviderAvailabilityLoading) {
          Get.snackbar("Loading...", "Please wait");
        } else if (state is ServiceProviderAvailabilitySuccess) {
          Get.snackbar("Slots Updated!", "Slots are updated");
          //  Navigator.pop(context);
        } else if (state is ServiceProviderAvailabilityError) {
          Get.snackbar("Loading...", "Please wait");
        }
      },
      child: Scaffold(
        appBar: MyAppBar(
          title: widget.day,
          trailing: GestureDetector(
              onTap: () {
                addSlots(2);
              },
              child: const Icon(Icons.add)),
          isDrawer: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...columns,
            MyButton(
              onPressed: () {
                ids.isNotEmpty ? update() : submit();
                Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    BlocProvider.of<ServiceProviderAvailabilityBloc>(context)
                        .add(GetServiceProviderAvailabilityEvent());
                  },
                );
              },
              buttonText: 'Save',
              bgColor: kPrimaryColor,
              fontColor: kWhiteColor,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ],
        ),
      ),
    );
  }

  void submit() {
    List<ServiceProviderAvailability> serviceProviderAvailabilities = [];
    int len = columns.length - ids.length;
    for (int i = 0; i < len; i++) {
      var serviceProviderAvailability = ServiceProviderAvailability(
        dayOfWeek: widget.weekDay,
        endTime: "${toController[i + ids.length].text}:00",
        startTime: "${fromController[i + ids.length].text}:00",
      );
      serviceProviderAvailabilities.add(serviceProviderAvailability);
    }
    if (len > 0) {
      BlocProvider.of<ServiceProviderAvailabilityBloc>(context).add(
        CreateServiceProviderAvailabilityEvent(
          model: CreateServiceProviderAvailabilityModel(
              serviceProviderAvailability: serviceProviderAvailabilities),
        ),
      );
    }
  }

  void update() {
    List<updateAvailability.ServiceProviderAvailability>
        serviceProviderAvailabilities = [];
    for (int i = 0; i < ids.length; i++) {
      var serviceProviderAvailability =
          updateAvailability.ServiceProviderAvailability(
        id: ids[i],
        dayOfWeek: widget.weekDay,
        endTime: "${toController[i].text}:00",
        startTime: "${fromController[i].text}:00",
      );
      serviceProviderAvailabilities.add(serviceProviderAvailability);
    }

    BlocProvider.of<ServiceProviderAvailabilityBloc>(context).add(
      UpdateServiceProviderAvailabilityEvent(
        model: updateAvailability.UpdateServiceProviderAvailabilityModel(
            serviceProviderAvailability: serviceProviderAvailabilities),
      ),
    );
    submit();
  }
}

class BuildTimeSlotContainer extends StatefulWidget {
  BuildTimeSlotContainer({
    super.key,
    this.onDelete,
    required this.fromController,
    required this.toController,
  });
  final VoidCallback? onDelete;
  TextEditingController fromController;
  TextEditingController toController;
  @override
  State<BuildTimeSlotContainer> createState() => _BuildTimeSlotContainerState();
}

class _BuildTimeSlotContainerState extends State<BuildTimeSlotContainer> {
  DateTime dateOfBirth = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: widget.onDelete,
                    icon: const Icon(Icons.remove),
                    color: kBlackColor45,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _from(),
                    verticalSpacing10,
                    _to(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _from() => kIsWeb
      ? SizedBox(
          width: getWidth(MediaQuery.of(context).size.width),
          child: DateTimePicker(
            firstDate: DateTime(2023),
            lastDate: DateTime(2100),
            type: DateTimePickerType.time,
            dateLabelText: 'Date',
            controller: widget.fromController,
            onChanged: (val) {
              widget.fromController.text =
                  dateTimetoTimeConverter(DateTime.parse(val));
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'From',
              errorBorder: textFielderrorBorder,
              focusedErrorBorder: textFielderrorBorder,
              focusedBorder: textFieldFocusBorder,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: textFieldEnabledBorder,
              filled: true,
            ),
          ),
        )
      : MyTextFieldWithNoLogo(
          hintText: 'From',
          readOnly: true,
          onTap: () {
            widget.fromController.text =
                dateTimetoTimeConverter(DateTime.now());
            BottomPicker.time(
              pickerTitle: const Text(
                'Set your availability',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: kPrimaryColor,
                ),
              ),
              onSubmit: (time) {
                widget.fromController.text = dateTimetoTimeConverter(time);
                setState(() {});
              },
              onCloseButtonPressed: () {
                print('Picker closed');
              },
              bottomPickerTheme: BottomPickerTheme.temptingAzure,
              use24hFormat: true,
              initialTime: Time(
                minutes: DateTime.now().minute,
              ),
              maxTime: Time(
                hours: DateTime.now().hour,
              ),
            ).show(context);
          },
          textEditingController: widget.fromController,
          validator: (val) {},
        );

  Widget _to() => kIsWeb
      ? SizedBox(
          width: getWidth(MediaQuery.of(context).size.width),
          child: DateTimePicker(
            firstDate: DateTime(2023),
            lastDate: DateTime(2100),
            type: DateTimePickerType.time,
            dateLabelText: 'Date',
            controller: widget.toController,
            onChanged: (val) {
              widget.toController.text =
                  dateTimetoTimeConverter(DateTime.parse(val));
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'To',
              errorBorder: textFielderrorBorder,
              focusedErrorBorder: textFielderrorBorder,
              focusedBorder: textFieldFocusBorder,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: textFieldEnabledBorder,
              filled: true,
            ),
          ),
        )
      : MyTextFieldWithNoLogo(
          hintText: 'To',
          readOnly: true,
          onTap: () {
            BottomPicker.time(
              pickerTitle: const Text(
                'Set your availability',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: kPrimaryColor,
                ),
              ),
              onSubmit: (time) {
                widget.toController.text = dateTimetoTimeConverter(time);
                setState(() {});
              },
              onCloseButtonPressed: () {},
              bottomPickerTheme: BottomPickerTheme.temptingAzure,
              use24hFormat: true,
              initialTime: Time(
                minutes: DateTime.now().minute,
              ),
              maxTime: Time(
                hours: DateTime.now().hour,
              ),
            ).show(context);
          },
          textEditingController: widget.toController,
          validator: (val) {},
        );
}
