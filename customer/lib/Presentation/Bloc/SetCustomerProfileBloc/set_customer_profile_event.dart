part of 'set_customer_profile_bloc.dart';

abstract class SetCustomerProfileEventBase {}

class SetCustomerProfileEvent extends SetCustomerProfileEventBase {
  SetUpCustomerProfileModel? setUpCustomerProfileModel;
  SetCustomerProfileEvent({this.setUpCustomerProfileModel});
}

class UpdateCustomerProfileEvent extends SetCustomerProfileEventBase {
  UpdateProfileModel? updateProfileModel;
  UpdateCustomerProfileEvent({this.updateProfileModel});
}
