import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String imageUrl;
  final String locationName;

  const LocationCard({super.key, required this.imageUrl, required this.locationName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130, // Adjusted width to make it proportional
      margin: const EdgeInsets.only(right: 8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              width: 120, // Match the width
              height: 160, // Increased height for a larger image
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120, // Match width to the image
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: const BoxDecoration(
              //color: Colors.black54, // Semi-transparent background for text readability
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Text(
              locationName,
              style: const TextStyle(
                fontSize: 18,
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