import 'package:flutter/material.dart';

class RecommendedCard extends StatefulWidget {
  final String imageUrl;
  final double price;
  final String description;
  final int rating;

  RecommendedCard({super.key, 
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.rating,
  });

  @override
  _RecommendedCardState createState() => _RecommendedCardState();
}

class _RecommendedCardState extends State<RecommendedCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  widget.imageUrl,
                  height: 150,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '\$${widget.price}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '/Night',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.flash_on,
                      color: Colors.orangeAccent,
                      size: 16,
                    ),
                    const SizedBox(width: 88),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(widget.rating.toString(), style: const TextStyle(fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  widget.description,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Private room / 4 beds',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}