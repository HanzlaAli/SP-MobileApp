import '../../Data/Models/DocumentModels/CreateAppointmentDocumentModel.dart';
import '../../Presentation/Bloc/AppointmentDocument/appointment_document_bloc.dart';
import '../../Presentation/Widgets/MyTextButton.dart';
import '../../Presentation/helper/Constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'MyButton.dart';

class AppointmentSummaryPopup extends StatefulWidget {
  AppointmentSummaryPopup({super.key, required this.appointmentId});
  int appointmentId;
  @override
  _AppointmentSummaryPopupState createState() =>
      _AppointmentSummaryPopupState();
}

class _AppointmentSummaryPopupState extends State<AppointmentSummaryPopup> {
  final TextEditingController _summaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppointmentDocumentBloc, AppointmentDocumentState>(
      listener: (context, state) {
        if (state is AppointmentSuccessState) {
          Get.snackbar("Success", "Document Added...");
          Get.back();
          Get.back();
        } else {
          Get.snackbar("Error", "Something wen't wrong");
          Get.back();
          Get.back();
        }
      },
      child: AlertDialog(
        title: const Text('Appointment Summary'),
        content: TextField(
          controller: _summaryController,
          maxLines: null, // Allow multiple lines in the text field
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          decoration: const InputDecoration(
            hintText: 'Type your appointment summary here...',
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: MyTextButton(
                  text: 'Cancel',
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog on Cancel
                    Navigator.of(context).pop(); // Close the dialog on Cancel
                  },
                ),
              ),
              SizedBox(
                width: 180,
                child: MyButton(
                    buttonText: 'Submit',
                    onPressed: () {
                      BlocProvider.of<AppointmentDocumentBloc>(context).add(
                        CreateAppointmentDocumentsEvent(
                          model: CreateAppointmentDocumentsModel(
                            createAppointmentDocumentModel:
                                CreateAppointmentDocumentModel(
                              appointmentId: widget.appointmentId,
                              summery: _summaryController.text,
                            ),
                          ),
                        ),
                      );
                    },
                    fontColor: kWhiteColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
