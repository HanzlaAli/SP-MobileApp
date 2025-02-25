// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart' show Bloc;
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/CustomerModel/CustomerProfileModel.dart';
import '../../../Presentation/Controllers/SetUpProfileController.dart';
import '../../../Presentation/Controllers/SharedPrefrenceController.dart';

import '../../Controllers/PushNotificationController.dart';
part 'get_user_profile_event.dart';
part 'get_user_profile_state.dart';

class GetUserProfileBloc
    extends Bloc<GetUserProfileEventBase, GetUserProfileStateBase> {
  final _setUpProfileController = SetUpProfileController();
  final _sharedPrefrenceController = SharedPrefrenceController();
  final pushNotificationController = PushNotificationController();

  GetUserProfileBloc() : super(GetUserProfileInitial()) {
    on<GetUserProfileEvent>((event, emit) async {
      emit(GetUserProfileLoading());
      String? token = await _sharedPrefrenceController.getToken();
      String? fcmToken;
      if (!kIsWeb) {
        fcmToken = await pushNotificationController.getFCMToken();
      }
      if (token != null) {
        Either<ErrorModel, CustomerProfileModel> res =
            await _setUpProfileController.getCustomerProfile(token);
        res.fold((l) => emit(GetUserProfileError(errorModel: l)), (r) {
          _sharedPrefrenceController.userIdSave(r.user!.id!);
          if (!kIsWeb) {
            pushNotificationController.setToken(
                r.user!.id.toString(), fcmToken!);
          }
          emit(GetUserProfileLoaded(customerProfileModel: r));
        });
      } else {
        emit(GetUserProfileError(
            errorModel: ErrorModel(code: 400, message: "Please LogIn again")));
      }
    });
  }
}
