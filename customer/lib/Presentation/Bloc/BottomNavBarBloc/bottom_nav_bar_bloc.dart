import 'package:bloc/bloc.dart';
import 'package:customer/Presentation/Screens/BookedServices/CustomerBookedServices.dart';

import '../../Screens/ServiceProvider/ServiceProviderScreen.dart';

import '../../Screens/ServicesScreens/ServicesScreen.dart';
import '/Presentation/Screens/Profile/Profile.dart';
import 'package:flutter/material.dart';
part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEventBase, BottomNavBarState> {
  BottomNavBarBloc() : super(BottomNavBarInitial()) {
    on<ChangeScreen>((event, emit) {
      switch (event.index) {
        case 0:
          emit(BottomNavBarLoaded(widget: const ProfileScreen()));
          break;
        case 1:
          emit(BottomNavBarLoaded(widget: const ServicesScreen()));
          break;
        case 2:
          emit(BottomNavBarLoaded(widget: const ServiceProviderScreen()));
          break;
        case 3:
          //   emit(BottomNavBarLoaded(widget: const CartScreen()));
          break;
        case 4:
          emit(BottomNavBarLoaded(widget: const CustomerBookedServicesScreen()));
          break;

        default:
          emit(BottomNavBarLoaded(widget: const ProfileScreen()));
      }
      ;
    });
  }
}
