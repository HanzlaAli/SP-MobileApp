part of 'customer_booked_services_bloc.dart';

abstract class CustomerBookedServicesState {}

class CustomerBookedServicesInitial extends CustomerBookedServicesState {}

class CustomerBookedServicesLoading extends CustomerBookedServicesState {}

class CustomerBookedServicesLoaded extends CustomerBookedServicesState {
  List<GetCustomerBookedServiceModel>? model;
  CustomerBookedServicesLoaded({this.model});
}

class CustomerBookedServicesError extends CustomerBookedServicesState {}
