import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Widgets/MyButton.dart';
import '../../Widgets/MyTextButton.dart';
import '../../Widgets/MyTextFieldWithNoLogo.dart';
import '../../helper/Constants/MyColors.dart';
import '../../helper/Constants/MySpaces.dart';

class AddComplaint extends StatefulWidget {
  const AddComplaint({super.key});

  @override
  _AddComplaintState createState() => _AddComplaintState();
}

class _AddComplaintState extends State<AddComplaint> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // context
      //     .read<CreateOrEditCustomerServiceRequestBloc>()
      //     .add(CreateCustomerServiceRequestEvent(
      //       model: CreateOrUpdateCustomerServiceRequestModel(
      //         title: titleController.text,
      //         description: descriptionController.text,
      //       ),
      //     ));
      // Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Create",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextFieldWithNoLogo(
                      textEditingController: titleController,
                      hintText: 'Title',
                      validator: (value) =>
                          value!.isEmpty ? 'Enter title' : null,
                    ),
                    verticalSpacing10,
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyTextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      text: "Cancel"),
                  SizedBox(
                    width: 80,
                    child: MyButton(
                      onPressed: _submitForm,
                      fontColor: kWhiteColor,
                      buttonText: "Submit",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
