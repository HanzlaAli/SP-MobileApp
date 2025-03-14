import 'package:customer/Presentation/Widgets/MyAppBar.dart';
import 'package:customer/Presentation/helper/Constants.dart';
import 'package:flutter/material.dart';

class ComplaintDetailScreen extends StatelessWidget {
  final String title;
  final String description;

  const ComplaintDetailScreen({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: MyAppBar(
        title: "Service Details",
        isDrawer: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailCard("Title", title),
            _buildDetailCard("Description", description),
          ],
        ),
      ),
    );
  }

  // Widget to display text details
  Widget _buildDetailCard(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
