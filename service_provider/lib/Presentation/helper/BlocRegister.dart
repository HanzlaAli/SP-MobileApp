// ignore_for_file: file_names
import 'package:mended_soluctions/Presentation/Bloc/complaint_bloc/complaint_bloc.dart';
import 'package:mended_soluctions/Presentation/Bloc/create_insurance_bloc/create_insurance_bloc.dart';
import 'package:mended_soluctions/Presentation/Bloc/get_customer_service_request_bloc/get_customer_service_request_bloc.dart';
import 'package:mended_soluctions/Presentation/Bloc/insurance_bloc/insurance_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mended_soluctions/Presentation/Bloc/service_type_bloc/service_type_bloc.dart';
import '../Bloc/AppOpenedBloc/app_opened_bloc.dart';
import '../Bloc/AppointmentRoom/appointment_room_bloc.dart';
import '../Bloc/AuthBloc/auth_bloc.dart';
import '../Bloc/ServiceProviderAvailability/serviceProvider_availability_bloc.dart';
import '../Bloc/ForgetPasswordBloc/forget_password_bloc.dart';
import '../Bloc/GetServiceProviderDetailBloc/get_serviceProvider_details_bloc.dart';
import '../Bloc/GetServiceProviderTherapiesBloc/get_serviceProvider_therapies_bloc.dart';
import '../Bloc/GetProfileBloc/get_profile_bloc.dart';
import '../Bloc/GetRequestedAppoinmentsOfCustomerBloc/get_requested_appoinments_of_customer_bloc.dart';
import '../Bloc/LogInBloc/log_in_bloc.dart';
import '../Bloc/RememberMeBloc/remember_me_bloc.dart';
import '../Bloc/SendMessageBloc/send_message_bloc.dart';
import '../Bloc/ServicesBloc/services_bloc.dart';
import '../Bloc/SetUpProfileBloc/set_up_profile_bloc.dart';
import '../Bloc/SignUpBloc/sign_up_bloc.dart';
import '../Bloc/ThemeBloc/theme_bloc.dart';
import '../Bloc/VerifyOtpBloc/verify_otp_bloc.dart';
import '../../main.dart';
import '../../Presentation/Bloc/ActiveNotActiveUserBloc/active_not_active_user_bloc.dart';
import '../../Presentation/Bloc/AddServiceProviderLicenseBloc/add_serviceProvider_license_bloc.dart';
import '../../Presentation/Bloc/AddServiceProviderSpecializationBloc/add_serviceProvider_specialization_bloc.dart';
import '../../Presentation/Bloc/AddServiceProviderTherapyBloc/add_serviceProvider_therapy_bloc.dart';
import '../../Presentation/Bloc/AppointmentDocument/appointment_document_bloc.dart';
import '../../Presentation/Bloc/ChangePasswordBloc/changePassword_bloc.dart';
import '../../Presentation/Bloc/CreateAppoinmentBloc/create_appoinment_bloc.dart';
import '../../Presentation/Bloc/DeleteAccountBloc/DeleteAccount_bloc.dart';
import '../../Presentation/Bloc/GetAppoinmentTypeBloc/get_appoinment_type_bloc.dart';
import '../../Presentation/Bloc/GetAppointmentHistoryBloc/get_appointment_history_bloc.dart';
import '../../Presentation/Bloc/GetServiceProviderAppoinments/get_serviceProvider_appoinments_bloc.dart';
import '../../Presentation/Bloc/GetServiceProviderLicenseTypeBloc/get_serviceProvider_license_types_bloc.dart';
import '../../Presentation/Bloc/GetServiceProviderSpecializationBloc/get_serviceProvider_specialization_bloc.dart';
import '../../Presentation/Bloc/GetServiceProviderTherapyTypesBloc/get_therapy_types_bloc.dart';
import '../../Presentation/Bloc/LogOutBloc/log_out_bloc.dart';
import '../../Presentation/Bloc/CustomerBookedServicesBloc/customer_booked_services_bloc.dart';
import '../../Presentation/Bloc/PushNotificationBloc/push_notification_bloc.dart';
import '../../Presentation/Bloc/QualificationBloc/qualification_bloc.dart';
import '../../Presentation/Bloc/TransactionBloc/transaction_bloc.dart';
import '../../Presentation/Bloc/WithdrawBloc/withdraw_bloc.dart';

class RegisterBloc {
  static Widget startUp() {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => LogInBloc()),
      BlocProvider(create: (context) => WithdrawBloc()),
      BlocProvider(create: (context) => SignUpBloc()),
      BlocProvider(create: (context) => ForgetPasswordBloc()),
      BlocProvider(create: (context) => AppOpenedBloc()),
      BlocProvider(create: (context) => AuthBloc()),
      BlocProvider(create: (context) => SetUpProfileBloc()),
      BlocProvider(create: (context) => GetProfileBloc()),
      BlocProvider(create: (context) => VerifyOtpBloc()),
      BlocProvider(create: (context) => AddServiceProviderLicenseBloc()),
      BlocProvider(create: (context) => AddServiceProviderTherapyBloc()),
      BlocProvider(create: (context) => AddServiceProviderSpecializationBloc()),
      BlocProvider(create: (context) => GetTherapyTypesBloc()),
      BlocProvider(create: (context) => GetServiceProviderSpecializationBloc()),
      BlocProvider(create: (context) => GetServiceProviderLicenseTypesBloc()),
      BlocProvider(create: (context) => ServicesBloc()),
      BlocProvider(create: (context) => GetServiceProviderTherapiesBloc()),
      BlocProvider(create: (context) => CustomerBookedServicesBloc()),
      BlocProvider(create: (context) => GetAppoinmentTypeBloc()),
      BlocProvider(create: (context) => CreateAppoinmentBloc()),
      BlocProvider(create: (context) => GetServiceProviderAppoinmentsBloc()),
      BlocProvider(
          create: (context) => GetRequestedAppoinmentsOfCustomerBloc()),
      BlocProvider(create: (context) => SendMessageBloc()),
      BlocProvider(create: (context) => AppointmentRoomBloc()),
      BlocProvider(create: (context) => TransactionBloc()),
      BlocProvider(create: (context) => ActiveNotActiveUserBloc()),
      BlocProvider(create: (context) => PushNotificationBloc()),
      BlocProvider(create: (context) => QualificationBloc()),
      BlocProvider(create: (context) => RememberMeBloc()),
      BlocProvider(create: (context) => ThemeBloc()),
      BlocProvider(create: (context) => ChangePasswordBloc()),
      BlocProvider(create: (context) => DeleteAccountBloc()),
      BlocProvider(create: (context) => LogOutBloc()),
      BlocProvider(create: (context) => GetAppointmentHistoryBloc()),
      BlocProvider(create: (context) => ServiceProviderAvailabilityBloc()),
      BlocProvider(create: (context) => GetDetailBloc()),
      BlocProvider(create: (context) => AppointmentDocumentBloc()),
      BlocProvider(create: (context) => GetCustomerServiceRequestBloc()),
      BlocProvider(create: (context) => ComplaintBloc()),
      BlocProvider(create: (context) => InsuranceBloc()),
      BlocProvider(create: (context) => CreateInsuranceBloc()),
      BlocProvider(create: (context) => ServiceTypeBloc()),
    ], child: const MyApp());
  }
}
