part of 'set_up_profile_bloc.dart';

abstract class SetUpProfileEventBase {}

class SetUpProfile extends SetUpProfileEventBase {
  SetUpProfileModel? model;
  SetUpProfile({this.model});
}

class UpdateProfilePicture extends SetUpProfileEventBase {
  File? img;
  UpdateProfilePicture({this.img});
}
