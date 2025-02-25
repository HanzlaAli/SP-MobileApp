import 'package:customer/Data/Models/CustomerRequestModels/create_or_update_customer_service_request.dart';
import 'package:customer/Presentation/Widgets/MyButton.dart';
import 'package:customer/Presentation/Widgets/MyTextButton.dart';
import 'package:customer/Presentation/Widgets/MyTextFieldWithNoLogo.dart';
import 'package:customer/Presentation/helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Data/Models/TherapyType/TherapyTypeModel.dart';
import '../../Bloc/TherapyTypeBloc/therapy_type_bloc.dart';
import '../../Bloc/create_or_edit_customer_service_request_bloc/create_or_edit_customer_service_request_bloc.dart';
import '../../Widgets/MyDropdownWithNoLogo.dart';

class AddCustomerRequest extends StatefulWidget {
  const AddCustomerRequest({super.key});

  @override
  _AddCustomerRequestState createState() => _AddCustomerRequestState();
}

class _AddCustomerRequestState extends State<AddCustomerRequest> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  TherapyTypeResponseModel? selectedServiceType;

  List<XFile> images = [];
  final ImagePicker picker = ImagePicker();

  Future<void> _pickImages() async {
    if (images.length >= 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You can only select up to 5 images.")),
      );
      return;
    }

    final List<XFile>? selectedImages = await picker.pickMultiImage();

    if (selectedImages != null) {
      setState(() {
        List<XFile> validImages = selectedImages.where((file) {
          String extension = file.path.split('.').last.toLowerCase();
          return ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp']
              .contains(extension);
        }).toList();

        if (validImages.length < selectedImages.length) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("Some files were not images and were ignored.")),
          );
        }

        if (images.length + validImages.length > 5) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Total images cannot exceed 5.")),
          );
        } else {
          images.addAll(validImages);
        }
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      context
          .read<CreateOrEditCustomerServiceRequestBloc>()
          .add(CreateCustomerServiceRequestEvent(
            model: CreateOrUpdateCustomerServiceRequestModel(
              title: titleController.text,
              serviceTypeId: selectedServiceType?.id,
              description: descriptionController.text,
              budget: int.tryParse(budgetController.text),
              images: images,
            ),
          ));
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    context.read<TherapyTypeBloc>().add(GetTherapyType());
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
                    _serviceTypeTextBox(),
                    MyTextFieldWithNoLogo(
                      textEditingController: budgetController,
                      hintText: 'Budget',
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter budget' : null,
                    ),
                    verticalSpacing10,
                    MyTextFieldWithNoLogo(
                      textEditingController: descriptionController,
                      hintText: 'Description',
                      validator: (value) =>
                          value!.isEmpty ? 'Enter description' : null,
                      maxLines: 3,
                    ),
                    MyTextButton(
                      onPressed: _pickImages,
                      text: "Select Images",
                      color: kPrimaryColor,
                    ),
                    const SizedBox(height: 10),
                    if (images.isNotEmpty)
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          itemCount: images.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Text(images[index].path.split('/').last,
                                overflow: TextOverflow.ellipsis),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  images.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
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

  Widget _serviceTypeTextBox() =>
      BlocBuilder<TherapyTypeBloc, TherapyTypeStateBase>(
        builder: (context, state) {
          if (state is TherapyTypeLoadingState) {
          } else if (state is TherapyTypeLoadedState) {
            return MyDropDownTextFieldwithNoLogo(
              hintText: 'Therapy Type',
              value: selectedServiceType,
              validator: (val) {
                return null;
              },
              onChanged: (newValue) {
                setState(() {
                  selectedServiceType = state.model!
                      .singleWhere((licenseType) => licenseType == newValue);
                });
              },
              items: state.model?.map((val) {
                return DropdownMenuItem<TherapyTypeResponseModel>(
                  value: val,
                  child: Text(val.name!),
                );
              }).toList(),
            );
          } else if (state is TherapyTypeErrorState) {}
          return Container();
        },
      );
}
