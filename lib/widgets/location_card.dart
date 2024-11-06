import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String imageUrl;
  final String locationName;

  const LocationCard({
    super.key,
    required this.imageUrl,
    required this.locationName,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.3, // Responsive width based on screen width
      margin: EdgeInsets.only(right: screenWidth * 0.02),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              width: screenWidth * 0.28,  // Width relative to screen size
              height: screenHeight * 0.2, // Height relative to screen size
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: screenWidth * 0.28,  // Match width to the image
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
            decoration: BoxDecoration(
              color: Colors.black54, // Semi-transparent background for readability
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Text(
              locationName,
              style: TextStyle(
                fontSize: screenWidth * 0.045, // Responsive font size
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
