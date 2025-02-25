// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../../Data/Models/CustomerModel/SetUpProfileModel.dart';
import '../../../Data/Models/CustomerModel/UpdateProfileModel.dart';
import '../../Controllers/PushNotificationController.dart';
import '../../Controllers/ServiceProviderController.dart';
import '../../Controllers/SetUpProfileController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
import '../../../Data/Models/FireBaseUserModel/UserModel.dart';

part 'set_customer_profile_event.dart';
part 'set_customer_profile_state.dart';

class SetCustomerProfileBloc
    extends Bloc<SetCustomerProfileEventBase, SetCustomerProfileStateBase> {
  SetCustomerProfileBloc() : super(SetCustomerProfileInitial()) {
    final sharedPrefrenceController = SharedPrefrenceController();
    final serviceProviderController = ServiceProviderController();
    final pushNotificationController = PushNotificationController();
    final setUpProfile = SetUpProfileController();

    on<SetCustomerProfileEvent>((event, emit) async {
      emit(SetCustomerProfileLoading());
      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        var res = await setUpProfile.setCustomerProfile(
            token, event.setUpCustomerProfileModel!);
        String fcmToken = await pushNotificationController.getFCMToken();
        res.fold((l) => emit(SetCustomerProfileError(errorModel: l)), (r) {
          serviceProviderController.addServiceProvider(UserModel(
              firstName: r.user!.firstName,
              fcmToken: fcmToken,
              imageUrl: r.profilePicture,
              isActive: false,
              lastActive: DateTime.now().toIso8601String(),
              lastName: r.user!.lastName,
              uId: r.user!.id));
          emit(SetCustomerProfileSuccess(successModel: SuccessModel()));
        });
      }
    });

    on<UpdateCustomerProfileEvent>((event, emit) async {
      emit(SetCustomerProfileLoading());
      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        var res =
            await setUpProfile.updateProfile(token, event.updateProfileModel!);
        res.fold((l) => emit(SetCustomerProfileError(errorModel: l)), (r) {
          emit(SetCustomerProfileSuccess(successModel: SuccessModel()));
        });
      }
    });
  }
}
