import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/Routes/Routes.dart';
import '../../../Bloc/GetProfileBloc/get_profile_bloc.dart';
import '../../../helper/Constants/MyColors.dart';
import '../../Settings/SettingsMenu.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _HomeAppBarState extends State<HomeAppBar> {
  String? profileImage, userName, address;
  @override
  void initState() {
    var profileState = BlocProvider.of<GetProfileBloc>(context).state;
    if (profileState is GetProfileLoaded) {
      var profile = profileState.serviceProviderProfileModel;
      profileImage = '${profile!.profilePicture}';
      userName = '${profile.user!.firstName} ${profile.user!.lastName}';
      address = '${profile.city}, ${profile.state}';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: kPrimaryColor,
      padding: const EdgeInsets.all(10),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => navigatorPush(context, const SettingsMenuScreen()),
          child: Row(
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  '$profileImage',
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Hi, $userName',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: kWhiteColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 3,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 12,
                          color: kYellowColor,
                        ),
                        Text(
                          address.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: kWhiteColor70),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
