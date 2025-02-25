import 'package:bloc/bloc.dart';
import '../../../Data/Models/CustomerModels/GetCustomerBookedServices.dart';
import '../../Controllers/CustomerServiceController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'customer_booked_services_event.dart';
part 'customer_booked_services_state.dart';

class CustomerBookedServicesBloc
    extends Bloc<CustomerBookedServicesEvent, CustomerBookedServicesState> {
  CustomerBookedServicesBloc() : super(CustomerBookedServicesInitial()) {
    final customerServiceController = CustomerServiceController();
    final sharedPrefrenceController = SharedPrefrenceController();
    on<GetAllCustomerBookedServices>((event, emit) async {
      emit(CustomerBookedServicesLoading());
      String? token = await sharedPrefrenceController.getToken();
      if (token != null) {
        var res = await customerServiceController.getAllServices(token);
        res.fold((l) => emit(CustomerBookedServicesError()),
            (r) => emit(CustomerBookedServicesLoaded(model: r)));
      }
    });
  }
}
