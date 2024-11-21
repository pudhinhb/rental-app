import 'package:flutter/material.dart';

class MostViewedHotelCard extends StatefulWidget {
  final String imageUrl;
  final double price;
  final String description;
  final int rating;

  const MostViewedHotelCard({
    super.key,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.rating,
  });

  @override
  _MostViewedHotelCardState createState() => _MostViewedHotelCardState();
}

class _MostViewedHotelCardState extends State<MostViewedHotelCard> {
  final ValueNotifier<bool> isLiked = ValueNotifier(false); // Use ValueNotifier

  void toggleLike() {
    isLiked.value = !isLiked.value; // Toggle the ValueNotifier
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  widget.imageUrl,
                  height: screenHeight * 0.2, // Adjust height based on screen size
                  width: screenWidth * 0.9,   // Adjust width based on screen size
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: screenHeight * 0.01,
                right: screenWidth * 0.02,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: ValueListenableBuilder<bool>(
                    valueListenable: isLiked,
                    builder: (context, value, child) {
                      return IconButton(
                        icon: Icon(
                          value ? Icons.favorite : Icons.favorite_border,
                          color: value ? Colors.red : Colors.grey,
                        ),
                        onPressed: toggleLike,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '\$${widget.price}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045, // Responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.01), // Responsive spacing
                    Text(
                      '/Night',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    const Icon(
                      Icons.flash_on,
                      color: Colors.orangeAccent,
                      size: 16,
                    ),
                    const Spacer(),
                    Icon(Icons.star, color: Colors.amber, size: screenWidth * 0.04),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      widget.rating.toString(),
                      style: TextStyle(fontSize: screenWidth * 0.035),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.005), // Responsive spacing
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  'Private room / 4 beds',
                  style: TextStyle(fontSize: screenWidth * 0.035,  color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    isLiked.dispose(); // Dispose of the ValueNotifier
    super.dispose();
  }
}
