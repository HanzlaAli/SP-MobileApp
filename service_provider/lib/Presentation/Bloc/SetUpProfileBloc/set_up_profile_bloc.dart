import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/FireBaseUserModel/UserModel.dart';
import '../../../Data/Models/ProfileModels/ServiceProviderProfileModel.dart';
import '../../../Data/Models/ProfileModels/SetUpProfileModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../../Presentation/Controllers/ServiceProviderController.dart';
import '../../../Presentation/Controllers/PushNotificationController.dart';
import '../../../Presentation/Controllers/SharedPrefrenceController.dart';
import '../../../Presentation/Controllers/SignUpController.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/ServiceProviderProfileController.dart';
part 'set_up_profile_event.dart';
part 'set_up_profile_state.dart';

class SetUpProfileBloc
    extends Bloc<SetUpProfileEventBase, SetUpProfileStateBase> {
  final _signUpController = SignUpController();
  final _serviceProviderController = ServiceProviderController();
  final _serviceProviderProfileController = ServiceProviderProfileController();
  final _sharedPrefrenceController = SharedPrefrenceController();
  final _pushNotificationController = PushNotificationController();
  SetUpProfileBloc() : super(SetUpProfileInitial()) {
    on<SetUpProfile>((event, emit) async {
      emit(SetUpProfileLoading());
      String? token = await _sharedPrefrenceController.getToken();

      String? fcmToken = await _pushNotificationController.getFCMToken();
      if (token != null) {
        Either<ErrorModel, ServiceProviderProfileModel> response =
            await _signUpController.setUpProfile(
                setUpProfileModel: event.model!, token: token);
        response.fold((l) => emit(SetUpProfileError()), (r) {
          _serviceProviderController.addServiceProvider(UserModel(
              firstName: r.user!.firstName,
              imageUrl: r.profilePicture,
              fcmToken: fcmToken,
              isActive: false,
              lastActive: DateTime.now().toIso8601String(),
              lastName: r.user!.lastName,
              uId: r.user!.id));

          return emit(SetUpProfileSuccess());
        });
      }
    });

    on<UpdateProfilePicture>((event, emit) async {
      emit(SetUpProfileLoading());
      String? token = await _sharedPrefrenceController.getToken();

      if (token != null) {
        Either<ErrorModel, SuccessModel> response =
            await _serviceProviderProfileController.updateServiceProviderProfile(
                event.img!, token);
        response.fold((l) => emit(SetUpProfileError()), (r) {
          return emit(SetUpProfileSuccess());
        });
      }
    });
  }
}
