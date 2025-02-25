
import 'package:customer/Presentation/Bloc/CustomerBookedServicesBloc/customer_booked_services_bloc.dart';
import 'package:customer/Presentation/Bloc/GetCustomerDetailBloc/get_customer_details_bloc.dart';
import 'package:customer/Presentation/Bloc/create_or_edit_customer_service_request_bloc/create_or_edit_customer_service_request_bloc.dart';
import 'package:customer/Presentation/Bloc/get_customer_service_request_bloc/get_customer_service_request_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Presentation/Bloc/ActiveNotActiveUserBloc/active_not_active_user_bloc.dart';
import '../../Presentation/Bloc/AppointmentDocument/appointment_document_bloc.dart';

import '../../Presentation/Bloc/PushNotificationBloc/push_notification_bloc.dart';
import '../../Presentation/Bloc/TherapyTypeBloc/therapy_type_bloc.dart';
import '../../Presentation/Bloc/TransactionBloc/transaction_bloc.dart';
import '../Bloc/AppOpened/app_opened_bloc.dart';
import '../Bloc/BottomNavBarBloc/bottom_nav_bar_bloc.dart';
import '../Bloc/CartBloc/cart_bloc.dart';
import '../Bloc/ChangePasswordBloc/changePassword_bloc.dart';
import '../Bloc/CreateAppoinmentBloc/create_appoinment_bloc.dart';
import '../Bloc/DeleteAccountBloc/DeleteAccount_bloc.dart';
import '../Bloc/GetAllServicesBloc/get_all_services_bloc.dart';
import '../Bloc/GetAppointmentHistoryBloc/get_appointment_history_bloc.dart';



import '../Bloc/GetAppointmnetByServiceProviderBloc/get_appointment_by_serviceProvider_bloc.dart';
import '../Bloc/GetRequestedAppoinmentsOfCustomerBloc/get_requested_appoinments_of_customer_bloc.dart';

import '../Bloc/GetServiceProviderAppoinments/get_serviceProvider_appoinments_bloc.dart';
import '../Bloc/GetServiceProvidersBloc/get_serviceProviders_bloc.dart';
import '../Bloc/GetServicesByServiceProviderBloc/get_services_by_serviceProvider_bloc.dart';
import '../Bloc/LogInBloc/log_in_bloc.dart';
import '../../Presentation/Bloc/AppointmentRoom/appointment_room_bloc.dart';
import '../../Presentation/Bloc/AuthBloc/auth_bloc.dart';
import '../../Presentation/Bloc/GetUserProfileBloc/get_user_profile_bloc.dart';
import '../../Presentation/Bloc/LogOutBloc/log_out_bloc.dart';

import '../../Presentation/Bloc/SendMessageBloc/send_message_bloc.dart';
import '../../Presentation/Bloc/VerifyOtpBloc/verify_otp_bloc.dart';
import '../Bloc/ForgetPasswordBloc/forget_password_bloc.dart';
import '../Bloc/RememberMeBloc/remember_me_bloc.dart';
import '../Bloc/RequestForAppoinmentBloc/request_for_appoinment_bloc.dart';

import '../Bloc/ServiceProviderAvailability/serviceProvider_availability_bloc.dart';
import '../Bloc/SetCustomerProfileBloc/set_customer_profile_bloc.dart';
import '../Bloc/SignUpBloc/sign_up_bloc.dart';
import '../../main.dart';
import '../Bloc/ThemeBloc/theme_bloc.dart';

class RegisterBloc {
  static Widget startup() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LogInBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => ForgetPasswordBloc()),
        BlocProvider(create: (context) => AppOpenedBloc()),
        BlocProvider(create: (context) => GetUserProfileBloc()),
        BlocProvider(create: (context) => VerifyOtpBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => BottomNavBarBloc()),
        BlocProvider(create: (context) => GetAllServicesBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => LogOutBloc()),
        BlocProvider(create: (context) => CustomerBookedServicesBloc()),
        BlocProvider(create: (context) => GetServiceProvidersBloc()),
        BlocProvider(create: (context) => GetServicesByServiceProviderBloc()),
        BlocProvider(create: (context) => GetCustomerAppoinmentsBloc()),
        BlocProvider(create: (context) => RequestForAppoinmentBloc()),
        BlocProvider(create: (context) => SendMessageBloc()),
        BlocProvider(create: (context) => AppointmentRoomBloc()),
        BlocProvider(create: (context) => TherapyTypeBloc()),
        BlocProvider(create: (context) => GetAppointmentByServiceProviderBloc()),
        BlocProvider(create: (context) => CreateAppoinmentBloc()),
        BlocProvider(create: (context) => ActiveNotActiveUserBloc()),
        BlocProvider(create: (context) => PushNotificationBloc()),
        BlocProvider(create: (context) => RememberMeBloc()),
        BlocProvider(
            create: (context) => GetRequestedAppoinmentsOfCustomerBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => ChangePasswordBloc()),
        BlocProvider(create: (context) => DeleteAccountBloc()),
        BlocProvider(create: (context) => LogOutBloc()),
        BlocProvider(create: (context) => GetAppointmentHistoryBloc()),
        BlocProvider(create: (context) => SetCustomerProfileBloc()),
        BlocProvider(create: (context) => TransactionBloc()),
        BlocProvider(create: (context) => ServiceProviderAvailabilityBloc()),
        BlocProvider(create: (context) => GetDetailBloc()),
        BlocProvider(create: (context) => AppointmentDocumentBloc()),
        BlocProvider(create: (context) => CreateOrEditCustomerServiceRequestBloc()),
        BlocProvider(create: (context) => GetCustomerServiceRequestBloc()),
      ],
      child: const MyApp(),
    );
  }
}
