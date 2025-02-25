import 'package:customer/Presentation/Widgets/MyAppBar.dart';
import 'package:customer/Presentation/helper/Constants.dart';
import 'package:flutter/material.dart';

class CustomerRequestDetailScreen extends StatelessWidget {
  final String title;
  final String serviceType;
  final String description;
  final List<String> imagePaths; // List of image file paths
  final double budget;

  const CustomerRequestDetailScreen({
    super.key,
    required this.title,
    required this.serviceType,
    required this.description,
    required this.imagePaths,
    required this.budget,
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
            _buildDetailCard("Service Type", serviceType.toString()),
            _buildDetailCard("Description", description),
            _buildDetailCard("Budget", "\$${budget.toStringAsFixed(2)}"),
            _buildImageGallery(), // Display images instead of paths
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

  // Widget to display images
  Widget _buildImageGallery() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Images",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          imagePaths.isNotEmpty
              ? SizedBox(
                  height: 150, // Fixed height for images
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imagePaths[index], // Load image from path
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 150,
                                height: 150,
                                color: Colors.grey[300],
                                child: const Icon(Icons.image_not_supported,
                                    color: Colors.grey),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const Text("No images available",
                  style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
