// ignore_for_file: must_be_immutable, file_names
import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../Data/Models/ServicesModels/create_or_edit_service_model.dart';
import '../../../Data/Models/TherapyModels/GetServiceProviderTherapyModel.dart';
import '../../../Presentation/Bloc/GetServiceProviderTherapiesBloc/get_serviceProvider_therapies_bloc.dart';
import '../../../Presentation/Bloc/ServicesBloc/services_bloc.dart';
import '../../../Presentation/helper/Constants/Constants.dart';
import '../../../Presentation/Widgets/MyButton.dart';
import '../../../Presentation/Widgets/MyTextFieldWithNoLogo.dart';
import '../../Widgets/MyTextButton.dart';
import '../../helper/Constants/MyColors.dart';
import '../../../Data/Models/ServicesModels/GetServiceModel.dart';
import '../../Widgets/MyDropdownWithNoLogo.dart';

class AddServices extends StatefulWidget {
  GetServicesModel? model;
  AddServices({super.key, this.model});

  @override
  State<AddServices> createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {
  @override
  void initState() {
    BlocProvider.of<GetServiceProviderTherapiesBloc>(context)
        .add(GetAllServiceProviderTherapies());
    if (widget.model != null) {
      nameController.text = widget.model!.name.toString();
      descriptionController.text = widget.model!.description.toString();
      chargesController.text = widget.model!.charges!.round().toString();
    }
    super.initState();
  }

  GetServiceProviderTherapyModel? getServiceProviderServiceModel;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final chargesController = TextEditingController();
  final discountController = TextEditingController();
  List<XFile> images = [];
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: SizedBox(
        width: double.infinity,
        height: Get.height,
        child: Card(
          shape:
              const RoundedRectangleBorder(borderRadius: servicesWidgetRadius),
          elevation: 10,
          //   margin: const EdgeInsets.symmetric(horizontal: 18),
          color: kPrimaryColor,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: servicesWidgetRadius,
              color: kWhiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _headerText(
                      context,
                      widget.model != null
                          ? "Update Service"
                          : 'Add New Services'),
                  _nameTextField(),
                  _serviceTypeTextBox(),
                  _chargesTextField(),
                  _discountTextField(),
                  _descriptionTextField(),
                  _imagesPicker(),
                  _submitButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _imagesPicker() {
    return Column(
      children: [
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
    );
  }

  Future<void> _pickImages() async {
    if (images.length >= 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You can only select up to 5 images.")),
      );
      return;
    }
    final List<XFile> selectedImages = await picker.pickMultiImage();

    if (selectedImages.isNotEmpty) {
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

  MyButton _submitButton(BuildContext context) {
    return MyButton(
      onPressed: () {
        if (getServiceProviderServiceModel != null) {
          submit();
          Get.back();
        }
      },
      fontColor: kWhiteColor,
      bgColor: kPrimaryColor,
      buttonText: widget.model != null ? 'Update' : 'Add',
    );
  }

  void submit() {
    if (getServiceProviderServiceModel?.id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a service type.")),
      );
      return;
    }
    // if (_formKey.currentState!.validate()) {
    BlocProvider.of<ServicesBloc>(context).add(
      CreateOrUpdateServiceEvent(
        model: CreateOrEditServiceModel(
          id: widget.model?.id ?? 0,
          charges: double.tryParse(chargesController.text) ?? 0.0,
          name: nameController.text,
          validTill: DateTime.now(),
          description: descriptionController.text,
          serviceProviderServiceTypeId: getServiceProviderServiceModel?.id ?? 0,
          serviceProviderEmail: '',
          discount: double.tryParse(discountController.text) ?? 0.0,
          images: images,
        ),
      ),
    );
    //}
  }

  MyTextFieldWithNoLogo _discountTextField() {
    return MyTextFieldWithNoLogo(
      textEditingController: discountController,
      validator: (val) {
        if (val!.isEmpty) {
          return "Field is Empty";
        }
        return '';
      },
      hintText: 'Dicount',
    );
  }

  MyTextFieldWithNoLogo _chargesTextField() {
    return MyTextFieldWithNoLogo(
      textEditingController: chargesController,
      validator: (val) {
        if (val!.isEmpty) {
          return "Field is Empty";
        }
        return '';
      },
      hintText: 'Charges',
    );
  }

  MyTextFieldWithNoLogo _nameTextField() {
    return MyTextFieldWithNoLogo(
      textEditingController: nameController,
      validator: (val) {
        if (val!.isEmpty) {
          return "Field is Empty";
        }
        return '';
      },
      hintText: 'Name',
    );
  }

  MyTextFieldWithNoLogo _descriptionTextField() {
    return MyTextFieldWithNoLogo(
      textEditingController: descriptionController,
      hintText: 'Description',
      validator: (value) => value!.isEmpty ? 'Enter description' : null,
      maxLines: 3,
    );
  }

  Widget _serviceTypeTextBox() => BlocBuilder<GetServiceProviderTherapiesBloc,
          GetServiceProviderTherapiesState>(
        builder: (context, state) {
          if (state is GetServiceProviderTherapiesLoading) {
          } else if (state is GetServiceProviderTherapiesLoaded) {
            if (widget.model != null && widget.model!.id != null) {
              getServiceProviderServiceModel = state.list?.firstWhere((x) =>
                  x.therapyName?.toLowerCase() ==
                  widget.model?.therapyName?.toLowerCase());
            }

            return SizedBox(
              width: kIsWeb ? Get.width * 0.3 : Get.width * 0.8,
              child: MyDropDownTextFieldwithNoLogo(
                hintText: 'Service Type',
                value: (getServiceProviderServiceModel ?? null),
                validator: (val) {
                  return null;
                },
                onChanged: (newValue) {
                  setState(() {
                    getServiceProviderServiceModel = state.list!
                        .singleWhere((licenseType) => licenseType == newValue);
                  });
                },
                items: state.list!.map((val) {
                  return DropdownMenuItem<GetServiceProviderTherapyModel>(
                    value: val,
                    child: Text(val.therapyName!),
                  );
                }).toList(),
              ),
            );
          } else if (state is GetServiceProviderTherapiesError) {}
          return Container();
        },
      );

  Widget _headerText(BuildContext context, String text) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
                color: kBlackColor38,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ],
      );
}
