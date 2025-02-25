import '../../../Presentation/Widgets/MyAppBar.dart';
import '../../../Presentation/Widgets/MyDrawer.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'About Us',
        isDrawer: false,
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'About Me',
                style: TextStyle(
                  fontSize: 24.0, // Heading font size
                  fontWeight: FontWeight.bold, // Heading font weight
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Text(
                'AppLogo is a comprehensive platform with integrated systems that allow '
                'scheduling with providers to fit your health care needs. Choose the provider that you need, '
                'schedule and pay within this one system to mend all of your healthcare needs. This platform is '
                'designed to be a one-stop shop to target all of your holistic healthcare/wellness needs.',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Text(
                'Contact: Please direct any further questions to info@AppLogo.com',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Text(
                'Address: 1344 Cross Creek Circle Unit 1 Tallahassee, FL 32301',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Text(
                'Privacy Policy: Please see attached documents drafted per lawyer.',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
