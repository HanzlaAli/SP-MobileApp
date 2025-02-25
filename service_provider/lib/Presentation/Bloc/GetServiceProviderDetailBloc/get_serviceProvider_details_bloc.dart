import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Presentation/Controllers/ServiceProviderProfileController.dart';
import '../../../Presentation/Controllers/SharedPrefrenceController.dart';
import 'package:path_provider/path_provider.dart';
import '../../../Data/Models/ServiceProvider/GetServiceProviderDetailsModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/PushNotificationController.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
part 'get_serviceProvider_details_event.dart';
part 'get_serviceProvider_details_state.dart';

class GetDetailBloc
    extends Bloc<GetServiceProviderDetailEventBase, GetServiceProviderDetailStateBase> {
  final _serviceProviderProfileController = ServiceProviderProfileController();
  final _sharedPrefrenceController = SharedPrefrenceController();
  final pushNotificationController = PushNotificationController();
  final pdf = pdfLib.Document();

  GetDetailBloc() : super(GetServiceProviderDetailInitial()) {
    on<GetServiceProviderDetailEvent>((event, emit) async {
      emit(GetServiceProviderDetailLoading());
      String? token = await _sharedPrefrenceController.getToken();
      if (token != null) {
        Either<ErrorModel, GetServiceProviderDetailsModel> res =
            await _serviceProviderProfileController.getServiceProviderDetails(token);
        res.fold((l) => emit(GetServiceProviderDetailError(errorModel: l)), (r) {
          designPdf(r);
          emit(GetServiceProviderDetailLoaded());
        });
      }
    });
  }
//Designing Pdf
  void designPdf(var serviceProviderData) {
    // Add serviceProvider details
    pdf.addPage(pdfLib.Page(
      build: (context) => pdfLib.Column(
        crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
        children: [
          pdfLib.Center(child: _buildBoldText('ServiceProvider Details')),
          pdfLib.SizedBox(height: 5),
          _buildUserDetails(serviceProviderData.user!),
          pdfLib.SizedBox(height: 5),
          _buildText('Bio: ${serviceProviderData.bio}'),
          pdfLib.SizedBox(height: 5),
          _buildText('Gender: ${serviceProviderData.gender}'),
          pdfLib.SizedBox(height: 5),
          _buildText('Business Address: ${serviceProviderData.businessAddress}'),
          pdfLib.SizedBox(height: 5),
          _buildText('Street Address: ${serviceProviderData.streetAddress}'),
          pdfLib.SizedBox(height: 5),
          _buildText('City: ${serviceProviderData.city}'),
          pdfLib.SizedBox(height: 5),
          _buildText('State: ${serviceProviderData.state}'),
          pdfLib.SizedBox(height: 5),
          _buildText('Zip: ${serviceProviderData.zip}'),
          pdfLib.SizedBox(height: 5),
          pdfLib.Center(child: _buildBoldText('ServiceProvider License')),
          pdfLib.SizedBox(height: 5),
          _buildText('Board: ${serviceProviderData.serviceProviderLicense?.board}'),
          pdfLib.SizedBox(height: 5),
          _buildText('Number: ${serviceProviderData.serviceProviderLicense?.number}'),
          pdfLib.SizedBox(height: 5),
          _buildText('Issue Date: ${serviceProviderData.serviceProviderLicense?.issueDate}'),
          pdfLib.SizedBox(height: 5),
          _buildText('Expiry Date: ${serviceProviderData.serviceProviderLicense?.expiryDate}'),
          pdfLib.SizedBox(height: 5),
          _buildText(
              'License Type: ${serviceProviderData.serviceProviderLicense?.licenseType?.name}'),
          pdfLib.SizedBox(height: 5),
          pdfLib.Center(child: _buildBoldText('ServiceProvider Qualification')),
          pdfLib.SizedBox(height: 5),
          _buildQualifications(serviceProviderData.qualifications),
          pdfLib.SizedBox(height: 5),
          pdfLib.Center(child: _buildBoldText('ServiceProvider Service Types')),
          pdfLib.SizedBox(height: 5),
          _buildTherapies(serviceProviderData.serviceProviderTherapies),
          pdfLib.SizedBox(height: 5),
          pdfLib.Center(child: _buildBoldText('ServiceProvider Specializations')),
          pdfLib.SizedBox(height: 5),
          _buildSpecializations(serviceProviderData.specializations),
          pdfLib.SizedBox(height: 5),
        ],
      ),
    ));

    // Add appointments table
    pdf.addPage(pdfLib.Page(
      build: (context) => pdfLib.Column(
        crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
        children: [
          pdfLib.Center(child: _buildBoldText('Appointments')),
          pdfLib.SizedBox(height: 5),
          _buildAppointmentsTable(serviceProviderData.appointments),
        ],
      ),
    ));

    // Save the PDF to a file
    savePDF(pdf);
  }

  // Helper method to build a Text widget
  pdfLib.Widget _buildText(String text) {
    return pdfLib.Text(text);
  }

  pdfLib.Widget _buildBoldText(String text) {
    return pdfLib.Text(text,
        style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold));
  }

  // Helper method to build user details
  pdfLib.Widget _buildUserDetails(User userData) {
    return pdfLib.Column(
      crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
      children: [
        _buildText('Name: ${userData.firstName} ${userData.lastName}'),
        _buildText('Email: ${userData.email}'),
        _buildText('Phone Number: ${userData.phoneNumber}'),
      ],
    );
  }

  // Helper method to build qualifications
  pdfLib.Widget _buildQualifications(List<Qualifications>? qualifications) {
    return pdfLib.Column(
      crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
      children: [
        if (qualifications != null)
          for (var qualification in qualifications)
            _buildText(
              'Name: ${qualification.name},\n Institution: ${qualification.institutionName},\n Procurement Year: ${qualification.procurementYear}',
            ),
      ],
    );
  }

  // Helper method to build serviceProvider therapies
  pdfLib.Widget _buildTherapies(List<ServiceProviderTherapies>? therapies) {
    return pdfLib.Column(
      crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
      children: [
        if (therapies != null)
          for (var therapy in therapies)
            _buildText('Therapy Name: ${therapy.therapyName}'),
      ],
    );
  }

  // Helper method to build specializations
  pdfLib.Widget _buildSpecializations(List<Specializations>? specializations) {
    return pdfLib.Column(
      crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
      children: [
        if (specializations != null)
          for (var specialization in specializations)
            _buildText('Name: ${specialization.name}'),
      ],
    );
  }

  // Helper method to build appointments table
  pdfLib.Widget _buildAppointmentsTable(List<Appointments>? appointments) {
    final tableHeaders = [
      'Customer Name',
      'Service',
      'Start Time',
      'End Time',
      'Date'
    ];
    final tableRows = appointments?.map<List<String>>((appointment) {
      return [
        appointment.customerName ?? "",
        appointment.customerServiceName ?? "",
        appointment.startTime ?? "",
        appointment.endTime ?? "",
        appointment.date ?? "",
      ];
    }).toList();

    return pdfLib.Table.fromTextArray(
      headers: tableHeaders,
      data: tableRows ?? [],
      headerStyle: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold),
      border: pdfLib.TableBorder.all(),
    );
  }

  // Helper method to save the PDF to a file
  Future<void> savePDF(pdfLib.Document pdf) async {
    try {
      // Get the document directory using path_provider
      final Directory? appDocDir = await getDownloadsDirectory();
      final String appDocPath = appDocDir!.path;

      // Create a file with a unique name in the document directory
      final String fileName =
          'serviceProvider_details_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final String filePath = '$appDocPath/$fileName';

      // Write the PDF to the file
      final File file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      // Optional: Open the PDF using the default PDF viewer on the device
      // OpenFile.open(file.path);
      print('PDF saved at: $filePath');
    } catch (e) {
      print('Error saving PDF: $e');
    }
  }
}
