import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/ProfileModels/ServiceProviderProfileModel.dart';
import '../../../Presentation/Controllers/ServiceProviderProfileController.dart';
import '../../../Presentation/Controllers/SharedPrefrenceController.dart';
import 'package:flutter/foundation.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/PushNotificationController.dart';
part 'get_profile_event.dart';
part 'get_profile_state.dart';

class GetProfileBloc extends Bloc<GetProfileEventBase, GetProfileStateBase> {
  final _serviceProviderProfileController = ServiceProviderProfileController();
  final _sharedPrefrenceController = SharedPrefrenceController();
  final pushNotificationController = PushNotificationController();

  GetProfileBloc() : super(GetProfileInitial()) {
    on<GetServiceProviderProfileEvent>((event, emit) async {
      emit(GetProfileLoading());
      String? token = await _sharedPrefrenceController.getToken();
      String? fcmToken;
      if (!kIsWeb) {
        fcmToken = await pushNotificationController.getFCMToken();
      }
      if (token != null) {
        Either<ErrorModel, ServiceProviderProfileModel> res =
            await _serviceProviderProfileController.getServiceProviderProfile(token);
        res.fold((l) => emit(GetProfileError(errorModel: l)), (r) {
          _sharedPrefrenceController.userIdSave(r.user!.id!);
          if (!kIsWeb) {
            pushNotificationController.setToken(
                r.user!.id.toString(), fcmToken!);
          }
          emit(GetProfileLoaded(serviceProviderProfileModel: r));
        });
      }
    });
 }
}
