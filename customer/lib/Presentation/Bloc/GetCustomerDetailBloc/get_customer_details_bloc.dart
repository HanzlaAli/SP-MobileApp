import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';
import '../../Controllers/SetUpProfileController.dart';
import '../../../Data/Models/CustomerModel/GetCustomerDetails.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/PushNotificationController.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import '../../Controllers/SharedPrefrenceController.dart';
part 'get_customer_details_event.dart';
part 'get_customer_details_state.dart';

class GetDetailBloc
    extends Bloc<GetCustomerDetailEventBase, GetCustomerDetailStateBase> {
  final _customerProfileController = SetUpProfileController();
  final _sharedPrefrenceController = SharedPrefrenceController();
  final pushNotificationController = PushNotificationController();
  final pdf = pdfLib.Document();

  GetDetailBloc() : super(GetCustomerDetailInitial()) {
    on<GetCustomerDetailEvent>((event, emit) async {
      emit(GetCustomerDetailLoading());
      String? token = await _sharedPrefrenceController.getToken();
      if (token != null) {
        Either<ErrorModel, GetCustomerDetailsModel> res =
            await _customerProfileController.getCustomerDetails(token);
        res.fold((l) => emit(GetCustomerDetailError(errorModel: l)), (r) {
          designPdf(r);
          emit(GetCustomerDetailLoaded());
        });
      }
    });
  }
//Designing Pdf
  void designPdf(var CustomerData) {
    // Add Customer details
    pdf.addPage(pdfLib.Page(
      build: (context) => pdfLib.Column(
        crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
        children: [
          pdfLib.Center(
              child: _buildBoldText(
                  '${CustomerData.user!.firstName} ${CustomerData.user!.lastName} Details')),
          pdfLib.SizedBox(height: 5),
          _buildUserDetails(CustomerData.user!),
          pdfLib.SizedBox(height: 10),
          pdfLib.Center(child: _buildBoldText('Appointments')),
          pdfLib.SizedBox(height: 5),
          _buildAppointmentsTable(CustomerData.appointments),
        ],
      ),
    ));

    // // Add appointments table
    // pdf.addPage(pdfLib.Page(
    //   build: (context) => pdfLib.Column(
    //     crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
    //     children: [],
    //   ),
    // ));

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
        appointment.CustomerName ?? "",
        appointment.CustomerServiceName ?? "",
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
