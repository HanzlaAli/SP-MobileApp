import '../../../Data/Models/AppointmentDocument/AppointmentDocumentModel.dart';
import '../../../Presentation/Bloc/AppointmentDocument/appointment_document_bloc.dart';
import '../../../Presentation/Screens/ErrorHandling/InternalServerErrorScreen.dart';
import '../../../Presentation/Widgets/MyAppBar.dart';
import '../../../Presentation/Widgets/MyTextButton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../../helper/Constants/MyColors.dart';
import '../../helper/ReusedFunctions.dart';
import '../ErrorHandling/EmptyDataScreen.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart'
//     as dt_picker;

class AppointmentDocumentScreen extends StatefulWidget {
  const AppointmentDocumentScreen({super.key});

  @override
  State<AppointmentDocumentScreen> createState() =>
      _AppointmentDocumentScreenState();
}

class _AppointmentDocumentScreenState extends State<AppointmentDocumentScreen> {
  DateTime? filterDate;
  @override
  void initState() {
    BlocProvider.of<AppointmentDocumentBloc>(context)
        .add(GetAllAppointmentDocumentsEvent(date: null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int columnCount = getCount(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: MyAppBar(
        title: 'History',
        isDrawer: true,
      ),
      body: RefreshIndicator(
        color: kPrimaryColor,
        onRefresh: () async {
          BlocProvider.of<AppointmentDocumentBloc>(context)
              .add(GetAllAppointmentDocumentsEvent(date: null));
        },
        child: BlocBuilder<AppointmentDocumentBloc, AppointmentDocumentState>(
          builder: (context, state) {
            if (state is AppointmentDocumentLoadingState) {
              return _shimmer(context);
            } else if (state is AppointmentDocumentLoadedState) {
              if (state.model.length == 0) {
                return Column(
                  children: [
                    _filter(),
                    Expanded(
                      child: Center(
                        child: EmptyDataScreen(text: 'Empty!'),
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _filter(),
                    Expanded(
                      child: ListView.builder(
                          itemCount: state.model.length,
                          itemBuilder: (context, rowindex) {
                            return Row(
                              children: List.generate(
                                columnCount,
                                (columnindex) {
                                  final int index =
                                      rowindex * columnCount + columnindex;
                                  if (index >= state.model.length) {
                                    return Expanded(child: Container());
                                  } else {
                                    return Expanded(
                                      child: MyCard(model: state.model[index]),
                                    );
                                  }
                                },
                              ),
                            );
                          }),
                    ),
                  ],
                );
              }
            } else if (state is AppointmentDocumentErrorState) {
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

  Padding _filter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyTextButton(
              text: 'Reset',
              color: Colors.red,
              onPressed: () {
                BlocProvider.of<AppointmentDocumentBloc>(context)
                    .add(GetAllAppointmentDocumentsEvent(date: null));
              }),
          GestureDetector(
            onTap: () {
              _filterDateTextField();
            },
            child: const Icon(
              Icons.calendar_today,
              size: 25,
              color: kPrimaryColor,
            ),
          )
        ],
      ),
    );
  }

  _filterDateTextField() => SizedBox();
  //  DatePicker.showDatePicker(
  //       context,
  //       theme: const dt_picker.DatePickerTheme(
  //         containerHeight: 210.0,
  //       ),
  //       currentTime: filterDate,
  //       showTitleActions: true,
  //       onConfirm: (date) {
  //         filterDate = date;
  //         setState(() {});
  //         BlocProvider.of<AppointmentDocumentBloc>(context)
  //             .add(GetAllAppointmentDocumentsEvent(date: date));
  //       },
  //     );

  SizedBox _shimmer(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
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
                    height: 140,
                    width: getWidth(MediaQuery.of(context).size.width),
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
}

class MyCard extends StatelessWidget {
  MyCard({Key? key, this.model}) : super(key: key);
  AppointmentDocumentModel? model;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.only(top: 15, right: kIsWeb ? 8 : 0),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: _buildTop(context),
      ),
    );
  }

  ListTile _buildTop(BuildContext context) {
    return ListTile(
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext context) {
          return ParagraphDialog(
            paragraph: model!.summery!,
          );
        },
      ),
      // leading: GestureDetector(
      //   onTap: () => Get.dialog(const ServiceProviderProfileScreen()),
      //   child: CircleAvatar(
      //     radius: 30,
      //     child: SvgPicture.asset('assets/Images/serviceProvider-male.svg'),
      //   ),
      // ),
      trailing: Text(
        DateFormat('dd-MM-yyyy').format(DateTime.parse(model!.date!)),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      title: Text(
        '${model?.serviceName}',
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${model?.customerName}',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Text(
              "${dateTimetoTimeConverter(DateTime.parse(model!.fromTime!))} - ${dateTimetoTimeConverter(DateTime.parse(model!.toTime!))}"),
        ],
      ),
    );
  }
}

class ParagraphDialog extends StatelessWidget {
  final String paragraph;

  const ParagraphDialog({super.key, required this.paragraph});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Appointment Details'),
      content: SingleChildScrollView(
        child: Text(paragraph),
      ),
      actions: [
        MyTextButton(
          text: "Close",
          color: kPrimaryColor,
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        )
      ],
    );
  }
}
