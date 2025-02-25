// ignore_for_file: file_names

import '../Widgets/MyCarouselItems.dart';

class OnBoardingController {
  List<MyCarouselItems> get list => [
        MyCarouselItems(
          firstText: 'Therapy wherever you are',
          lastText:
              'Find the best qualified therapist for your \n needs using your location and personal \n prefrences',
          image: 'assets/Images/serviceProviderOnBoarding.svg',
         
        ),
        MyCarouselItems(
          firstText: 'Easy appointment scheduling',
          lastText:
              'View your therapist\'s availability months in \n advance to secure appointments that fit your \n wellness routine',
          image: 'assets/Images/bookTherapyCalendarOnBoarding.svg',
        ),
        MyCarouselItems(
          firstText: 'Become your best self with our \n therapy professionals',
          lastText:
              'All of our therapists have been background \n verified and hold advanced post-graduate \n degrees to guide you in improving your mental \n wellness',
          image: 'assets/Images/serviceProviderOnBoarding.svg',
        ),
        MyCarouselItems(
          firstText: 'Build on  diversity,powered by \n inclusion',
          lastText:
              'it\'s okay to have prefrences. With a diverse, with all types of  experiances, ethnicities and identities, we \n make it easy for you to find your type',
          image: 'assets/Images/listonBoarding.svg',
        ),
      ];
}
