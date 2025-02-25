import 'package:customer/Data/Models/CustomerRequestModels/create_or_update_customer_service_request.dart';
import 'package:customer/Presentation/Widgets/MyButton.dart';
import 'package:customer/Presentation/Widgets/MyTextButton.dart';
import 'package:customer/Presentation/Widgets/MyTextFieldWithNoLogo.dart';
import 'package:customer/Presentation/helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Data/Models/CustomerRequestModels/customer_request_service_model.dart';
import '../../../Data/Models/CustomerRequestModels/delete_customer_request_image_model.dart';
import '../../../Data/Models/TherapyType/TherapyTypeModel.dart';
import '../../Bloc/TherapyTypeBloc/therapy_type_bloc.dart';
import '../../Bloc/create_or_edit_customer_service_request_bloc/create_or_edit_customer_service_request_bloc.dart';
import '../../Widgets/MyDropdownWithNoLogo.dart';

class EditCustomerRequest extends StatefulWidget {
  final CustomerRequestServiceModel existingRequest;

  const EditCustomerRequest({super.key, required this.existingRequest});

  @override
  _EditCustomerRequestState createState() => _EditCustomerRequestState();
}

class _EditCustomerRequestState extends State<EditCustomerRequest> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController budgetController;
  TherapyTypeResponseModel? selectedServiceType;

  List<XFile> images = [];
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.existingRequest.title);
    descriptionController =
        TextEditingController(text: widget.existingRequest.description);
    budgetController =
        TextEditingController(text: widget.existingRequest.budget?.toString());
    context.read<TherapyTypeBloc>().add(GetTherapyType());
  }

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
          .add(UpdateCustomerServiceRequestEvent(
            model: CreateOrUpdateCustomerServiceRequestModel(
              id: widget.existingRequest.id,
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
              const Text("Edit",
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
                    if (widget.existingRequest.images != null ||
                        images.isNotEmpty)
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          itemCount:
                              (widget.existingRequest.images?.length ?? 0) +
                                  images.length,
                          itemBuilder: (context, index) {
                            if (index <
                                (widget.existingRequest.images?.length ?? 0)) {
                              // Display existing images
                              return ListTile(
                                title: Text(
                                    widget.existingRequest.images![index]
                                        .split('/')
                                        .last,
                                    overflow: TextOverflow.ellipsis),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {
                                    setState(() {
                                      _onDeletePopUp(
                                          context,
                                          widget.existingRequest.id ?? 0,
                                          widget
                                              .existingRequest.images![index]);
                                    });
                                  },
                                ),
                              );
                            } else {
                              // Display newly selected images
                              int newIndex = index -
                                  (widget.existingRequest.images?.length ?? 0);
                              return ListTile(
                                title: Text(
                                    images[newIndex].path.split('/').last,
                                    overflow: TextOverflow.ellipsis),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {
                                    setState(() {
                                      images.removeAt(newIndex);
                                    });
                                  },
                                ),
                              );
                            }
                          },
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
            selectedServiceType = state.model!.singleWhere((servicetType) =>
                servicetType.name?.toLowerCase() ==
                widget.existingRequest.serviceType?.toLowerCase());
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

  Future _onDeletePopUp(BuildContext context, int id, String imagePath) =>
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: kWhiteColor,
            title: const Text(
              "Confirm",
              style: TextStyle(
                color: kBlackColor,
              ),
            ),
            content: const Text(
              "Are you sure you want to delete this image?",
              style: TextStyle(
                color: kBlackColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () {
                  BlocProvider.of<CreateOrEditCustomerServiceRequestBloc>(
                          context)
                      .add(DeletePictureCustomerServiceRequestEvent(
                          model: DeleteCustomerRequestImageModel(
                              imagePath: imagePath, serviceRequestId: id)));
                  Navigator.pop(context);
                },
                child: const Text('Yes'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () => Navigator.pop(context),
                child: const Text('No'),
              ),
            ],
          );
        },
      );
}
