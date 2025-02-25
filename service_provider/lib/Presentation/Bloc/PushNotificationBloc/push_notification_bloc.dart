import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/FireBaseUserModel/UserModel.dart';
import '../../../Data/Models/PushNotificationModel/MessagePuchNotificationModel.dart';
import '../../../Data/Models/PushNotificationModel/PushNotificationModel.dart';
import '../../../Data/Models/PushNotificationModel/VideoCallPushNotificationModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/ServiceProviderController.dart';
import '../../Controllers/PushNotificationController.dart';
part 'push_notification_event.dart';
part 'push_notification_state.dart';

class PushNotificationBloc
    extends Bloc<PushNotificationEvent, PushNotificationState> {
  final pushNotificationController = PushNotificationController();
  final serviceProviderController = ServiceProviderController();
  PushNotificationBloc() : super(PushNotificationInitial()) {
    on<SendMessageNotification>((event, emit) async {
      Either<ErrorModel, UserModel> res = await serviceProviderController
          .getServiceProviderByIdFromFirebase(event.model!.data!.reciverId.toString());

      res.fold((l) => null, (r) {
        var model = PushNotificationModel(
          notification: event.model!.notification,
          priority: "high",
          to: r.fcmToken,
          data: event.model!.data!.toJson(),
        );
        pushNotificationController.setNotification(model);
      });
    });
    on<SendVideoCallJoiningNotification>((event, emit) async {
      Either<ErrorModel, UserModel> res = await serviceProviderController
          .getServiceProviderByIdFromFirebase(event.model!.data!.customerId.toString());
      res.fold((l) => null, (r) {
        var model = PushNotificationModel(
          notification: event.model!.notification,
          priority: "high",
          to: r.fcmToken,
          data: event.model!.data!.toJson(),
        );
        pushNotificationController.setNotification(model);
      });
    });
  }
}
