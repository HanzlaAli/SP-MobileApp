// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/CustomerModel/SetUpProfileModel.dart';
import '../../../Presentation/Controllers/SetUpProfileController.dart';
import '../../../Data/Models/FireBaseUserModel/UserModel.dart';
import '../../../Data/Models/UserModels/AuthModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/UserModels/SignUpModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Controllers/ServiceProviderController.dart';
import '../../Controllers/PushNotificationController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
import '../../Controllers/SignUpController.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final _signUpController = SignUpController();
  final _setUpProfile = SetUpProfileController();
  final pushNotificationController = PushNotificationController();
  final serviceProviderController = ServiceProviderController();

  final _sharedPrefrenceController = SharedPrefrenceController();
  SignUpBloc() : super(SignUpInitial()) {
    on<NewUserAccount>((event, emit) async {
      emit(SignUpLoading());
      Either<ErrorModel, AuthModel> response =
          await _signUpController.signUp(signUpModel: event.signUpModel!);
      response.fold((l) {}, (r) async {
        if (r.token != null) {
          _sharedPrefrenceController.tokenSave(r.token!);
          _sharedPrefrenceController.tokenExpirationSave(r.expiration!);
        }
      });
      String? token = await _sharedPrefrenceController.getToken();

      if (token != null) {
        var setUpProfileResponse = await _setUpProfile.setCustomerProfile(
            token, event.setUpCustomerProfileModel!);

        String fcmToken = await pushNotificationController.getFCMToken();
        setUpProfileResponse.fold((l) {}, (r) {
          serviceProviderController.addServiceProvider(UserModel(
              firstName: r.user!.firstName,
              fcmToken: fcmToken,
              imageUrl: r.profilePicture,
              isActive: false,
              lastActive: DateTime.now().toIso8601String(),
              lastName: r.user!.lastName,
              uId: r.user!.id));
          emit(SignUpSuccess(
              successModel: SuccessModel(message: 'New User Added!')));
        });
      }
    });
  }
}
